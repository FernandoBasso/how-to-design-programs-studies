#lang htdp/bsl
(require 2htdp/universe)
(require 2htdp/image)

;
; EXERCISE 41:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._.D.K._%28exercise._car-test%29%29
;
; Car moving world program.
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PHYSICAL CONSTANTS
;;

(define WHEEL-RADIUS 15)

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

(define SUM (+ 1 2 3))

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
(check-expect
 (render 50)
 (place-image CAR 50 Y-CAR BACKGROUND))

(check-expect
 (render 223)
 (place-image CAR 223 Y-CAR BACKGROUND))

(define (render ws)
  (place-image CAR ws Y-CAR BACKGROUND))

;;
; WorldState -> WorldState
; Moves the car by three pixels to the right for every tick.
;
(check-expect (tock 0) (+ 0 3))
(check-expect (tock 3) (+ 3 3))

(define (tock x)
  (+ x 3))


;;
; WorldState -> Boolean
; Computes whether the program should stop running.

(check-expect (stop? 0) #f)
(check-expect (stop? 100) #f)
(check-expect
 (stop? (- WIDTH-OF-WORLD (image-width CAR)))
 #f)
(check-expect
 (stop? (+ (- WIDTH-OF-WORLD (* 1/2 (image-width CAR))) 1))
 #t)

(define (stop? ws)
  (> ws (- WIDTH-OF-WORLD (* 1/2 (image-width CAR)))))

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
            [to-draw render]
            [stop-when stop?]))
#;
(main 5)


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

