#lang htdp/bsl
(require 2htdp/image)
(require 2htdp/universe)

;
; EXERCISE 61:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._ex~3aalternative-data-design2%29%29
;

;;
; All sizes are based off BULB-RADIUS so changing it automatically
; and correctly resizes everything else.
;
(define BULB-RADIUS 90)

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
; The way the program is designed, it doesn't matter if we later
; decide to change the values of these constants to 'red, 'green and
; 'yellow or "red", "green" and "yellow". Everything will just keeping
; working fine.
;
(define RED 0)
(define GREEN 1)
(define YELLOW 2)

(check-expect (add 0 0) (+ 0 0))
(check-expect (add 1 1) (+ 1 1))
(check-expect (add -1 -1) (+ -1 -1))

(define (add x y)
  (+ x y))

;;
; An S-TrafficLight is one of:
; • RED
; • GREEN
; • YELLOW
;

;;
; S-TrafficLight -> S-TrafficLight
;
; Runs the program from some initial world state.  Changes the light
; every two seconds, forever.
;
; USAGE:
;
;   (main RED)
;
(define (main cs)
  (big-bang cs
            [to-draw tl-render]
            [on-tick tl-next 2]))

;;
; TrafficLight -> TrafficLight
; Yields the next state given the current state cs.
;
(check-expect (tl-next RED) GREEN)
(check-expect (tl-next GREEN) YELLOW)
(check-expect (tl-next YELLOW) RED)

(define (tl-next cs)
  (cond
    [(equal? cs RED) GREEN]
    [(equal? cs GREEN) YELLOW]
    [(equal? cs YELLOW) RED]))

;;
; TrafficLight CircleMode -> TrafficLight
; Renders the current state cs as an image.
;
(check-expect
 (tl-render RED)
 (place-image (lights RED) X-CENTER Y-CENTER FRAME))

(check-expect
 (tl-render GREEN)
 (place-image (lights GREEN) X-CENTER Y-CENTER FRAME))

(check-expect
 (tl-render YELLOW)
 (place-image (lights YELLOW) X-CENTER Y-CENTER FRAME))

(define (tl-render cs)
  (place-image
   (lights cs) X-CENTER Y-CENTER FRAME))


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
 (lights RED)
 (beside
  SPC (bulb-on 'red)
  SPC (bulb-off 'green) SPC
  (bulb-off 'yellow) SPC))

(check-expect
 (lights GREEN)
 (beside
  SPC (bulb-off 'red)
  SPC (bulb-on 'green) SPC
  (bulb-off 'yellow) SPC))

(check-expect
 (lights YELLOW)
 (beside
  SPC (bulb-off 'red)
  SPC (bulb-off 'green) SPC
  (bulb-on 'yellow) SPC))

(define (lights cs)
  (cond
    [(equal? cs RED)
     (beside
      SPC (bulb-on 'red)
      SPC (bulb-off 'green) SPC
      (bulb-off 'yellow) SPC)]
    [(equal? cs GREEN)
     (beside
      SPC (bulb-off 'red)
      SPC (bulb-on 'green) SPC
      (bulb-off 'yellow) SPC)]
    [(equal? cs YELLOW)
     (beside
      SPC (bulb-off 'red)
      SPC (bulb-off 'green) SPC
      (bulb-on 'yellow) SPC)]))

