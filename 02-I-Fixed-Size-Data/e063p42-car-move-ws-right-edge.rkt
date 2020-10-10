#lang htdp/bsl
(require 2htdp/universe)
(require 2htdp/image)

;
; EXERCISE 42:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._.D.K._%28exercise._design9a%29%29
;
; Car moving world program.
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PHYSICAL CONSTANTS
;;

(define WHEEL-RADIUS 12)

(define WIDTH-OF-WORLD (* WHEEL-RADIUS 40))

(define Y-CAR (* WHEEL-RADIUS 8))

; <1>
(define WHEEL-DISTANCE (* WHEEL-RADIUS 2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GRAPHICAL CONSTANTS
;;

(define TREE
  (underlay/xy
   (circle (* 2 WHEEL-RADIUS) "solid" "green")
   (* 1.6 WHEEL-RADIUS) (* 3 WHEEL-RADIUS)
   (rectangle (* 1/3 WHEEL-RADIUS) (* 4 WHEEL-RADIUS) "solid" "brown")))

(define
  BACKGROUND
  (overlay/align
   'center
   'bottom
   TREE
   (empty-scene WIDTH-OF-WORLD (* 1/4 WIDTH-OF-WORLD))))

(define WHEEL
  (circle WHEEL-RADIUS 'solid 'black))

(define SPACE
  (rectangle WHEEL-DISTANCE WHEEL-RADIUS 'solid 'white))

(define BOTH-WHEELS
  (beside WHEEL SPACE WHEEL))

(define CAR-TOP (rectangle
                 (* WHEEL-RADIUS  4)
                 (* WHEEL-RADIUS 3)
                 'solid
                 'red))

(define CAR-BOT (rectangle
                 (* WHEEL-RADIUS 8)
                 (* WHEEL-RADIUS 2)
                 'solid
                 'red))

(define CAR-BODY (overlay/align 'center 'bottom CAR-TOP CAR-BOT))

(define CAR (overlay/offset
             CAR-BODY
             0
             (* WHEEL-RADIUS 1.5)
             BOTH-WHEELS))

(define CAR-LENGTH (image-width CAR))

(define CAR-HALF (* 1/2 CAR-LENGTH))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FUNCTIONS
;;

;;
; A WorldState is a Number.
; Interpretation: the number of pixels between the right border of the
; scene and the right-most edge of the car.
;

;;
; WorldState -> Image
; Places the image of the car x pixels from the right margin of
; the BACKGROUND image.
;

;; The right edge of the car touches the right edge of the scene.
(check-expect
 (render CAR-HALF)
 (place-image CAR (- WIDTH-OF-WORLD CAR-HALF) Y-CAR BACKGROUND))

(check-expect
 (render 123)
 (place-image CAR (- WIDTH-OF-WORLD 123) Y-CAR BACKGROUND))

(define (render ws)
  (place-image CAR (- WIDTH-OF-WORLD ws) Y-CAR BACKGROUND))

;;
; WorldState -> WorldState
; Moves the car by three pixels to the right for every tick.
;
(check-expect (tock 25) (- 25 3))
(check-expect (tock 200) (- 200 3))

(define (tock x)
  (- x 3))


;;
; WorldState -> Boolean
; Computes whether the program should stop running.
;
; To the very left of the scene.
(check-expect (stop? (- WIDTH-OF-WORLD CAR-HALF)) #f)

; Middle of teh scene.
(check-expect (stop? (* 1/2 WIDTH-OF-WORLD)) #f)

; Near the end.
(check-expect (stop? (* 1/5 WIDTH-OF-WORLD)) #f)

; Touching the end.
(check-expect (stop? CAR-HALF) #f)

; 1 px past the end.
(check-expect (stop? (- CAR-HALF 1)) #t)

(define (stop? ws)
  (< (- ws CAR-HALF) 0))

;;
; WorldState -> WorldState
; Launches the program from some initial state.
;
; Example:
;
;   (main (- WIDTH-OF-WORLD CAR-HALF))
;
(define (main ws)
  (big-bang ws
            [on-tick tock]
            [to-draw render]
            [stop-when stop?]))

;;
; Start with the left edge of the car touching the left edge of the scene.
;
#;
(main (- WIDTH-OF-WORLD CAR-HALF))

