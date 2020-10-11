#lang htdp/bsl
(require 2htdp/universe)
(require 2htdp/image)

;
; EXERCISE 46:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._design13%29%29
;
; A program that continuously moves the cat from left to right.
;
; Continuation of the previous practice program. Diff with:
;
;   $ diff --color --unified e066p45-pet-v1.rkt e067p46-pet-v2.rkt
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PHYSICAL AND GRAPHICAL CONSTANTS
;;

;;
; The canvas width and height.
(define CW 600)
(define CH (* 1/4 CW))

;;
; Let's move the cat 3 pixels per clock tick.
;
(define PX-PER-TICK 3)

;;
; The image of the cat when the world state is even.
;
(define CAT1 (bitmap "../images/cat1.png"))

;;
; The image of the cat when the world state is odd.
;
(define CAT2 (bitmap "../images/cat2.png"))

;;
; The cats width and half width.
;
; Both images have the same width, so we can define the constants
; based on any of them.
;
(define CAT-WIDTH (image-width CAT1))
(define CAT-HALF-WIDTH (/ CAT-WIDTH 2))

;;
; The y position of the cat; the center of the y-axis.
;
(define Y-CAT (/ CH 2))

;;
; Position where the right edge of the cat is just about
; to enter the left edge of the canvas. Run these to see:
;
;   (render OFF-LEFT)
;   (render (+ OFF-LEFT 1))
;   (render (+ OFF-LEFT 4))
;   (render (+ OFF-LEFT 11))
;
(define OFF-LEFT (- 0 CAT-HALF-WIDTH))


;;
; Position where the left edge of the cat just passes
; the right edge of the canvas. Run these to see:
;
;   (render OFF-RIGHT)
;   (render (- OFF-RIGHT 1))
;   (render (- OFF-RIGHT 4))
;   (render (- OFF-RIGHT 11))
;
(define OFF-RIGHT (+ CW CAT-HALF-WIDTH))

;;
; The background inside of which the cat is positioned.
;
(define BG (empty-scene CW CH))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FUNCTIONS
;;

;;
; A WorldState is a Number.
;
; INTERP: The number of pixels from the left edge of the SCENE and the
; center of the cat image.
;

;;
; WorldState -> WorldState
; Computes the next world state from the given world state.
;
; When the cat disappears on the right, sets the world state to an
; initial value so that the cat reappears on the left. We are using
; OFF-LEFT as this “initial” state.
;
(check-expect (tock 0) (+ 0 PX-PER-TICK))

(check-expect (tock 11) (+ 11 PX-PER-TICK))

; 1 px away from disappearing on the right. Can still increment.
(check-expect (tock OFF-LEFT) (+ 3 OFF-LEFT))

; 1 px past the right edge of the canvas. Must reset to OFF-LEFT.
(check-expect (tock (+ OFF-RIGHT 1)) OFF-LEFT)

(define (tock ws)
  (cond
    [(> ws OFF-RIGHT) OFF-LEFT]
    [else (+ ws PX-PER-TICK)]))

;;
; WorldState -> Image
; Chooses the image based on the value of the world state.
; • Even numbers → CAT1;
; • Odd numbers → CAT2.
;
(check-expect (choose-img 2) CAT1)
(check-expect (choose-img 3) CAT2)

(define (choose-img ws)
  (cond
    [(odd? (floor ws)) CAT2]
    [else CAT1]))

;;
; WorldState -> Image
; Places that cat at x position from the left edge of the scene.
;
(check-expect (render 90)
              (place-image CAT1 90 Y-CAT BG))

(check-expect (render 91)
              (place-image CAT2 91 Y-CAT BG))

(define (render ws)
  (place-image
   (choose-img ws)
   ws
   Y-CAT BG))

;;
; WorldState -> WorldState
; Launches the program from some initial state.
;
(define (main ws)
  (big-bang ws
   [on-tick tock]
   [to-draw render]))

