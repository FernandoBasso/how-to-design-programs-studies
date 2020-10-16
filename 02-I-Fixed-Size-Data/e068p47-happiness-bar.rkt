#lang htdp/bsl
(require 2htdp/image)
(require 2htdp/universe)

;
; EXERCISE 47:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._design14%29%29
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PHYSICAL AND GRAPHICAL CONSTANTS
;;

;;
; The scaling value for how much to compute everything. Since we are
; using values from 0 to 100, that looks like percentage (not that the
; scene should be 100 pixels wide, we can scale the scene and
; everything else). So, we use a scaling factor so we can compute
; stuff in terms of percentages and not fixed values.
;
(define SCALING 4)

;;
; How much to decrease happiness on the arrow down event.
;
(define DECREASE-FACTOR 1/5)

;;
; How much to increase the happiness on the arrow up event.
;
(define INCREASE-FACTOR 1/3)

;;
; Scene width. All other scaling and dimensions are based on this value.
;
(define CW (* 100 SCALING))

;;
; The height is “one eighth” of the width so it looks more like
; “happiness bar” than a simple rectangle.
;
(define CH (* 1/8 CW))

;;
; The background scene.
;
(define BG (empty-scene CW CH))

;;
; The y position of the red bar. Make it sit on the bottom edge of the
; canvas.
(define Y-BAR (/ CH 2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FUNCTIONS
;;

;;
; A WorldState is a Number.
; INTERP: The level of happiness from 0 to 100.
;

;;
; WorldState -> WorldState
; Increases happiness by INCREASE-FACTOR.
;
(check-expect (my/up 0) (+ 0 (* INCREASE-FACTOR 0)))
(check-expect
 (my/up (* 50 SCALING))
 (+ (* 50 SCALING) (* INCREASE-FACTOR (* 50 SCALING))))

(define (my/up ws)
  (cond
    [(> (+ ws (* INCREASE-FACTOR ws)) CW) CW]
    [else (+ ws (* INCREASE-FACTOR ws))]))

;;
; WorldState -> WorldState.
; Decreases happiness by DECREASE-FACTOR.
;
(check-expect (my/down 100) (- 100 (* DECREASE-FACTOR 100)))
(check-expect (my/down 50) (- 50 (* DECREASE-FACTOR 50)))

(define (my/down ws)
  (cond
    [(< (- ws (* DECREASE-FACTOR ws)) 0) 0]
    [else (- ws (* DECREASE-FACTOR ws))]))

;;
; WorldState -> WorldState
; Calculates the new world state:
; • Decrease happiness by -0.1 on each clock tick.
;

; Can't go below 0%.
(check-expect (tock 0) 0)
(check-expect (tock -7) 0)

(check-expect (tock (* 90 SCALING)) (- (* 90 SCALING) (* 0.1 SCALING)))

(check-expect
 (tock (* 100 SCALING))
 (- (* 100 SCALING) (* 0.1 SCALING)))

(define (tock ws)
  (cond
    [(< (- ws (* 0.1 SCALING)) 0) 0]
    [else (- ws (* 0.1 SCALING))]))

;;
; WorldState String -> WorldState
; • Descrese happiness by 1/5 on arrow down;
; • Increase happiness by 1/3 on arrow up.
; • All other key events are not handled.

; Only up and down are handled.
(check-expect
 (handl-key (* 80 SCALING) "#\") ; "#\return", or "\r"
 (* 80 SCALING))

(check-expect
 (handl-key (* 80 SCALING) "up")
 (my/up (* 80 SCALING)))

(check-expect
 (handl-key (* 80 SCALING) "down")
 (my/down (* 80 SCALING)))

(define (handl-key ws ke)
  (cond
    [(key=? ke "up") (my/up ws)]
    [(key=? ke "down") (my/down ws)]
    [else ws]))

;;
; stop?
;

;;
; WorldState -> Image
; Makes the red bar wit the specified width.
;
(define (make-bar width)
  (rectangle width CH 'solid 'red))

;;
; WorldState -> Image
; Draws the happiness bar with ws width.
;
(check-expect
 (render 0)
 (place-image (make-bar 0) 0 Y-BAR BG))

(check-expect
 (render (* 40 SCALING))
 (place-image
  (make-bar (* 40 SCALING))
  (/ (* 40 SCALING) 2)
  Y-BAR
  BG))

(check-expect
 (render (* 100 SCALING))
 (place-image
  (make-bar (* 100 SCALING))
  (/ (* 100 SCALING) 2)
  Y-BAR
  BG))

(define (render ws)
  (place-image
   (make-bar ws)
   (/ ws 2)
   Y-BAR
   BG))

;;
; WorldState -> WorldState
; Starts the world program from some initial state.
;
; USAGE:
;
;   (main (* 100 SCALING))
;
; or:
;
;   (main CW)
;
(define (main ws)
  (big-bang ws
            [on-tick tock]
            [on-key handl-key]
            [to-draw render]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Not all constants seem to deserve a name because they are used only
;; once and are documented where they are used.
;;

