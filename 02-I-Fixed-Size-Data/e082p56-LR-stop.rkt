#lang htdp/bsl
(require 2htdp/image)
(require 2htdp/universe)

;
; EXERCISE 56:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._itemization._%28exercise._cond7%29%29
;

;;
; Distances in pixels.
;
(define HEIGHT 300)
(define WIDTH 100)

;;
; How fast the rocket moves in the y-axis.
;
(define YDELTA 3)

(define BACKG (empty-scene WIDTH HEIGHT))

(define ROCKET (rectangle 5 30 'solid 'red))

;;
; The reference point of the rocket. Its center.
;
(define CENTER (/ (image-height ROCKET) 2))

;;
; A LRCD (short of Launching Rocket Count Down) is one of:
; - "resting"
; - a Number between -3 and -1
; - a NonnegativeNumber
;
; INTERP: A grounded rocket.
; In countdown mode, a number denotes the distance between the top
; of the canvas and the rocket (its height).
;
; NOTE: The numbers -3, -2 and -1 represent the world after the
; user has pressed the space bar (this program should wait for three
; ticks after the space bar is pressed before starting displaying
; the rocket moving scenery.)
;;

;;
; LRCD -> Image
; Renders the state as a resting or flying rocket.
;
(check-expect
 (show "resting")
 (place-image-y HEIGHT))

(check-expect
 (show HEIGHT)
 (place-image-y HEIGHT))

(check-expect
 (show -2)
 (place-image (text "-2" 20 "red")
              10 (* 3/4 WIDTH)
              (place-image-y HEIGHT)))

(check-expect
 (show 53)
 (place-image-y 53))

; Rocket totally hidden above (and outside) the canvas.
(check-expect
 (show 0)
 (place-image-y 0))

(define (show y)
  (cond
    [(string? y)
     (place-image ROCKET 10 (- HEIGHT CENTER) BACKG)]
    [(<= -3 y -1)
     (place-image
      (text (number->string y) 20 'red)
      10 (* 3/4 WIDTH)
      (place-image ROCKET 10 (- HEIGHT CENTER) BACKG))]
    [(>= y 0)
     (place-image ROCKET 10 (- y CENTER) BACKG)]))

;;
; LRCD KeyEvent -> LRCD
; Starts the countdown when the space bar is pressed (only if
; the rocket is still resting.)
;
(check-expect (launch "resting" " ") -3)
(check-expect (launch "resting" "z") "resting")
(check-expect (launch -3 " ") -3)
(check-expect (launch -1 " ") -1)
(check-expect (launch 33 "z") 33)
(check-expect (launch 33 " ") 33)

(define (launch y ke)
  (cond
    [(string? y) (if (string=? ke " ") -3 y)]
    [(<= -3 y -1) y]
    [(>= y 0) y]))
;
; The first ‘cond’ clause will either return -3 or ‘y’. But what is
; ‘y’‽ It is the current state, which is “resting” (the only possible
; string in the first class of values of LRCD). So, if it is a string,
; it is _that_ string.
;;

;;
; LRCD -> LRCD
; Raises the rocket by YDELTA (only if it is moving already).
;
(check-expect (fly "resting") "resting")
(check-expect (fly -3) -2)
(check-expect (fly -2) -1)
(check-expect (fly -1) HEIGHT)
(check-expect (fly 10) (- 10 YDELTA))
(check-expect (fly 22) (- 22 YDELTA))

(define (fly y)
  (cond
    [(string? y) y]
    [(<= -3 y -1) (if (= y -1) HEIGHT (+ y 1))]
    [(>= y 0) (- y YDELTA)]))

;;
; LRCD -> Bool
; Signals the end of the program.
;

(check-expect (stop? "resting") #f)
(check-expect (stop? -3) #f)
(check-expect (stop? -1) #f)
(check-expect (stop? HEIGHT) #f)
(check-expect (stop? (/ HEIGHT 2)) #f)
(check-expect (stop? 1) #f)
(check-expect (stop? 0) #t)

(define (stop? y)
  (and (not (string? y)) (= y 0)))

;;
; LRCD -> LRCD
; Starts the program from the given state.
;
; USAGE:
;
;   (main "resting")
;
; Press “<Space>” to start the contdown and watch the rocket fly.
;
(define (main s)
  (big-bang s
            [to-draw show]
            [on-key launch]
            [on-tick fly]
            [stop-when stop?]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Helpers
;

;;
; NonnegativeNumber -> Image
; Places rocket at y position, x-centered.
;

; Rocket totally hidden above (and outside) the canvas.
(check-expect
 (place-image-y 0)
 (place-image ROCKET 10 (- 0 CENTER) BACKG))

(check-expect
 (place-image-y 53)
 (place-image ROCKET 10 (- 53 CENTER) BACKG))

; Rocket touching bottom edge of canvas but totally visible.
(check-expect
 (place-image-y HEIGHT)
 (place-image ROCKET 10 (- HEIGHT CENTER) BACKG))

(define (place-image-y y)
  (place-image ROCKET 10 (- y CENTER) BACKG))


