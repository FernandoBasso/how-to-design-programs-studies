#lang htdp/bsl
(require 2htdp/universe)
(require 2htdp/image)

;
; EXERCISE 43:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._.D.K._%28exercise._design9%29%29
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
; An AnimationState is a Number.
;
; INTERPRETATION: The number of clock ticks since the animation started.
;

;;
; AnimationState -> AnimationState
; Calculates the next animation state based on the current animation state.
;
(check-expect (tock 0) (+ 0 3))
(check-expect (tock 1) (+ 1 3))
(check-expect (tock 13) (+ 13 3))

(define (tock t)
  (+ t 3))

;;
; AnimationState -> Image
; Places the center of the car ws pixels from the left edge of the BACKGROUND.
;

(check-expect
 (render CAR-HALF)
 (place-image CAR CAR-HALF Y-CAR BACKGROUND))

(check-expect
 (render (* 1/2 WIDTH-OF-WORLD))
 (place-image CAR (* 1/2 WIDTH-OF-WORLD) Y-CAR BACKGROUND))

(check-expect
 (render (+ (* 1/2 WIDTH-OF-WORLD) CAR-LENGTH))
 (place-image CAR (+ (* 1/2 WIDTH-OF-WORLD) CAR-LENGTH) Y-CAR BACKGROUND))

(define (render as)
  (place-image CAR as Y-CAR BACKGROUND))

;;
; AnimationState -> Boolean
; Checks whether the program should stop.
;

; Touching left edge of scene.
(check-expect (stop? CAR-HALF) #f)

; Middle of the scene.
(check-expect (stop? (* 1/2 WIDTH-OF-WORLD)) #f)

; Touching right edge of the scene.
(check-expect (stop? (- WIDTH-OF-WORLD CAR-HALF)) #f)

; 1 pixel past the right edge of the scene.
(check-expect
 (stop? (+ (- WIDTH-OF-WORLD CAR-HALF) 1))
 #t)

(define (stop? as)
  (> as (- WIDTH-OF-WORLD CAR-HALF)))

;;
; AnimationState -> AnimationState
; Launches the program from some initial state.
;
; Example:
;
;  (main CAR-HALF)
;
(define (main as)
  (big-bang as
            [stop-when stop?]
            [on-tick tock]
            [to-draw render]))

;
; It is more or less the same thing as ‘animate’ from the prologe
; section, except that with ‘big-bang’ we can control some other
; stuff, like when to stop the program and how much to “advance” per
; clock tick.
;


;
; @TODO: How to do the Sine Wave thing‽
;
; “Use the data definition to design a program that moves the car
; according to a sine wave. (Don’t try to drive like that.)”
;

