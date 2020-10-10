#lang htdp/bsl
(require 2htdp/universe)
(require 2htdp/image)

;
; EXERCISE 44:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._.D.K._%28exercise._car-test-again%29%29
;
; Car moving world program. Clicking moves it through “hyperspace”.
;
; Sample Problem Design a program that moves a car across the world
; canvas, from left to right, at the rate of three pixels per clock
; tick. If the mouse is clicked anywhere on the canvas, the car is
; placed at the x-coordinate of that click.
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PHYSICAL CONSTANTS
;;

(define WHEEL-RADIUS 12)

(define WIDTH-OF-WORLD (* WHEEL-RADIUS 40))

(define Y-CAR (* WHEEL-RADIUS 8))

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
; AnimationState Number Number String -> AnimationState
; Place the car at x-mouse if the given me is button-down.
;
; NOTE: Clicking somewhere on the background _after_ the program has
; reached its “end” state does _not_ cause the car to move to the
; place clicked.
;

(check-expect (hyper 21 10 20 "enter") 21)
(check-expect (hyper 42 10 20 "button-down") 10)
(check-expect (hyper 42 10 20 "move") 42)

(define (hyper x-position-of-car x-mouse y-mouse me)
  (cond
    [(string=? me "button-down") x-mouse]
    [else x-position-of-car]))

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
            [on-mouse hyper]
            [to-draw render]))

