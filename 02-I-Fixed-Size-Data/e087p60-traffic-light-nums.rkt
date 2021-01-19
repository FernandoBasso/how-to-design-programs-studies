#lang htdp/bsl
(require 2htdp/image)
(require 2htdp/universe)

;
; EXERCISE 60:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._ex~3aalternative-data-design%29%29
;
; NOTE: This exercise ends up leaving the program in a state in which
; it is impossible to run it because we changed ‘tl-next’ to
; ‘tl-next-n’ but some other functions still consume symbols.
;
; The previous version conveyed intention more clearly because the
; color names red, green and yellow are much more descriptive than the
; numbers 0, 1 and two. ‘tl-next’ was simplified, shortened, and made
; more elegant, though.
;

;;
; All sizes are based off BULB-RADIUS so changing it automatically
; and correctly resizes the other ones.
;
(define BULB-RADIUS 30)

;;
; A small square used as the spacer/gutter between and around
; the bulbs.
;
(define SPC (square (* 1/4 BULB-RADIUS) 'solid 'white))

;;
; Must accommodate the height of one bulb plus top and bottom
; padding.
;
(define FRAME-HEIGHT (+ (* 2 BULB-RADIUS) (* 2 (image-height SPC))))

;;
; The frame width must accommodate all three lights plus the space
; between and around them.
;
(define FRAME-WIDTH (+ (* 6 BULB-RADIUS) (* 4 (image-width SPC))))

(define FRAME (empty-scene FRAME-WIDTH FRAME-HEIGHT))

(define X-CENTER (/ (image-width FRAME) 2))
(define Y-CENTER (/ (image-height FRAME) 2))

;;
; A N-TrafficLight is one of:
; • 0, INTERP: the traffic light shows red;
; • 1, INTERP: the traffic light shows green;
; • 2, INTERP: the traffic light shows yellow.
;

;;
; TrafficLight -> TrafficLight
; Runs the program from some initial world state.
; Changes the light every two seconds, forever.
;
; USAGE:
;
;   (main 'red)
;
(define (main cs)
  (big-bang cs
            [to-draw tl-render]
            [on-tick tl-next-n 2]))

;;
; TrafficLight -> TrafficLight
; Yields the next state given the current state cs.
;
(check-expect (tl-next-n 0) 1)
(check-expect (tl-next-n 1) 2)
(check-expect (tl-next-n 2) 0)

(define (tl-next-n cs)
  (modulo (+ cs 1) 3))

;;
; TrafficLight CircleMode -> TrafficLight
; Renders the current state cs as an image.
;
(check-expect
 (tl-render 'red)
 (place-image (lights 'red) X-CENTER Y-CENTER FRAME))

(check-expect
 (tl-render 'green)
 (place-image (lights 'green) X-CENTER Y-CENTER FRAME))

(check-expect
 (tl-render 'yellow)
 (place-image (lights 'yellow) X-CENTER Y-CENTER FRAME))

(define (tl-render cs)
  (place-image
   (lights cs) X-CENTER Y-CENTER FRAME))

;;
; TrafficLight -> Image
; Renders a solid bulb from the current state cs.
;
(check-expect
 (bulb-on 'red)
 (circle BULB-RADIUS 'solid 'red))

(define (bulb-on cs)
  (circle BULB-RADIUS 'solid cs))

;;
; TrafficLight -> Image
; Draws an outlined bulb from the current state cs.
;
(check-expect
 (bulb-off 'red)
 (circle BULB-RADIUS 'outline 'red))

(define (bulb-off cs)
  (circle BULB-RADIUS 'outline cs))

;;
; TrafficLight -> Image
; Renders the tree bulbs side by side with the turned on light
; according to the current state cs.
;
(check-expect
 (lights 'red)
 (beside
  SPC (bulb-on 'red)
  SPC (bulb-off 'green) SPC
  (bulb-off 'yellow) SPC))

(check-expect
 (lights 'green)
 (beside
  SPC (bulb-off 'red)
  SPC (bulb-on 'green) SPC
  (bulb-off 'yellow) SPC))

(check-expect
 (lights 'yellow)
 (beside
  SPC (bulb-off 'red)
  SPC (bulb-off 'green) SPC
  (bulb-on 'yellow) SPC))

(define (lights cs)
  (cond
    [(symbol=? cs 'red)
     (beside
      SPC (bulb-on 'red)
      SPC (bulb-off 'green) SPC
      (bulb-off 'yellow) SPC)]
    [(symbol=? cs 'green)
     (beside
      SPC (bulb-off 'red)
      SPC (bulb-on 'green) SPC
      (bulb-off 'yellow) SPC)]
    [(symbol=? cs 'yellow)
     (beside
      SPC (bulb-off 'red)
      SPC (bulb-off 'green) SPC
      (bulb-on 'yellow) SPC)]))

