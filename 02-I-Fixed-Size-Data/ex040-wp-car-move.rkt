#lang htdp/bsl
(require 2htdp/universe)
(require 2htdp/image)

;
; EXERCISE 40:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._.D.K._%28exercise._car-test%29%29
;
; Car moving world program.
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PHYSICAL CONSTANTS
;;

(define WIDTH-OF-WORLD 200)

(define WHEEL-RADIUS 5)

; <1>
(define WHEEL-DISTANCE (* WHEEL-RADIUS 2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GRAPHICAL CONSTANTS
;;

(define BACKGROUND (empty-scene WIDTH-OF-WORLD (* 1/4 WIDTH-OF-WORLD)))

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FUNCTIONS
;;

;;
; A WorldState is a Number.
; Interpretation: the number of pixels between the left border of the
; scene and the car.
;

;;
; WorldState -> Image
; Places the image of the car x pixels from the left margin of
; the BACKGROUND image.
;
(define (render x)
  BACKGROUND)

;;
; WorldState -> WorldState
; Moves the car by three pixels to the right for every tick.
;
(check-expect (tock 0) (+ 0 3))
(check-expect (tock 3) (+ 3 3))

(define (tock x)
  (+ x 3))


;;
; WorldState -> WorldState
; Launches the program from some initial state.
;
; Example:
;
;   (main 13)
;
(define (main ws)
  (big-bang ws
            [on-tick tock]
            [to-draw render]))


;
; <1> WHEEL-DISTANCE is a computed constant because it is computed
; from another value. It is not a simple assignment of a constant to a
; variable like ‘(define NUM 1)’.
;
; Graphical constants are usually computed and tend to involve
; physical constants.
;
; @NOTE: In the program the “entire” World State is simply the numeric
; value of ‘x’.
;
; @TODO: “An alternative is to count the number of clock ticks that
; have passed and to use this number as the state of the world. We
; leave this design variant as an exercise.”

