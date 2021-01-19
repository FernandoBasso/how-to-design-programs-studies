#lang htdp/bsl
(require 2htdp/image)

;
; NOTE: This is a WIP file from the examples, interleaved with
; exercises proposed while developing this program.


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
 (place-image ROCKET 10 (- HEIGHT CENTER) BACKG))

(check-expect
 (show HEIGHT)
 (place-image ROCKET 10 (- HEIGHT CENTER) BACKG))

(check-expect
 (show -2)
 (place-image (text "-2" 20 "red")
              10 (* 3/4 WIDTH)
              (place-image ROCKET 10 (- HEIGHT CENTER) BACKG)))

(check-expect
 (show 53)
 (place-image ROCKET 10 (- 53 CENTER) BACKG))

; Rocket totally hidden above (and outside) the canvas.
(check-expect
 (show 0)
 (place-image ROCKET 10 (- 0 CENTER) BACKG))

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
(define (launch y ke)
  y)

;;
; LRCD -> LRCD
; Raises the rocket by YDELTA (only if it is moving already).
;
(define (fly y)
  y)