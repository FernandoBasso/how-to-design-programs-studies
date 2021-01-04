#lang htdp/bsl
(require 2htdp/image)
(require 2htdp/universe)

;;
;; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28figure._fig~3aufo%29%29
;;

;;
; A WorldState is a Number;
; INTERP: Number of pixels between the top and the UFO.
;;

;;
;; Distances in terms of pixels.
;;

;;
; How many pixels to move at each tick.
;
(define STEP 3)

;;
; Width and height of the canvas.
;
(define WIDTH 300)
(define HEIGHT 100)

;;
; @TODO: What is the use of this?
;
(define CLOSE (/ HEIGHT 3))

(define MTSCN (empty-scene WIDTH HEIGHT))

(define UFO (overlay
             (circle 10 'solid 'green)
             (circle 20 'solid 'green)))

;;
; WorldState -> WorldState
;
(define (main y0)
  (big-bang y0
            [on-tick nxt]
            [to-draw render]))

;;
; WorldState -> WorldState
; Computes next location of UFO.
;
(check-expect (nxt 11) (+ 11 3))

(define (nxt y)
  (+ y 3))

;;
; WorldState -> Image
; Places UFO at given height into the center of MTSCN.
;
(check-expect
 (render 11)
 (overlay/align
  'center
  'bottom
  (status-line 11)
  (place-image UFO (* 1/2 WIDTH) 11 MTSCN)))

(define (render w)
  (overlay/align
   'center
   'bottom
   (status-line w)
   (place-image UFO (* 1/2 WIDTH) w MTSCN)))

;;
; WorldState -> Image
; Produces status line text according to UFOs height.
;

(check-expect
 (status-line (- HEIGHT 15))
 (text "landed" 24 'olive))

(check-expect
 (status-line 11)
 (text "descending" 24 'red))

(check-expect
 (status-line (/ HEIGHT 2))
 (text "closing in" 24 'blue))

(define (status-line y)
  (cond
    [(>= y (- HEIGHT (image-height UFO))) (text "landed" 24 'olive)]
    [(< y (* 1/3 HEIGHT)) (text "descending" 24 'red)]
    [(>= y (* 1/3 HEIGHT)) (text "closing in" 24 'blue)]))

