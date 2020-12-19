#lang htdp/bsl
(require 2htdp/image)
(require 2htdp/universe)

;
; EXERCISE 51:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._cond3%29%29
;

;
; A simplistic representation of a traffic light.
;
; We call it “simplistic” because it does not include the “off” state,
; the “blinking red” state, or the “blinking yellow” state.
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PHYSICAL AND GRAPHICAL CONSTANTS
;;

(define RADIUS 32)
(define WIDTH-OF-WORLD (* RADIUS 2))

(define MTSCN (empty-scene WIDTH-OF-WORLD WIDTH-OF-WORLD))

;;
; For demonstration purposes, let's make the Big-Bang tick the clock
; every 2 seconds rather than the default 28 times per second so we
; can see the colors changing.
;
(define TICK-RATE 2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FUNCTIONS
;;

;;
; Draws a TrafficLight
;
(check-expect (light 'green) (circle RADIUS 'solid 'green))
(check-expect (light 'yellow) (circle RADIUS 'solid 'yellow))
(check-expect (light 'red) (circle RADIUS 'solid 'red))

(define (light color)
  (circle RADIUS 'solid color))

(define RED-LIGHT (light 'red))
(define YELLOW-LIGHT (light 'yellow))
(define GREEN-LIGHT (light 'green))

;;
; A WorldState is one of the following images:
; • RED-LIGHT
; • YELLOW-LIGHT
; • GREEN-LIGHT
;

;
; INTERP: The three images represent the three possible states
; a traffic light may assume.
;

;;
; TrafficLight -> TrafficLight
; Yields the next state given the current state s.
;
(check-expect (traffic-light-next RED-LIGHT) GREEN-LIGHT)
(check-expect (traffic-light-next GREEN-LIGHT) YELLOW-LIGHT)
(check-expect (traffic-light-next YELLOW-LIGHT) RED-LIGHT)

(define (traffic-light-next img)
  (cond
    [(image=? img RED-LIGHT) GREEN-LIGHT]
    [(image=? img GREEN-LIGHT) YELLOW-LIGHT]
    [(image=? img YELLOW-LIGHT) RED-LIGHT]))

;;
; TrafficLight -> TrafficLight
; Draws the circle of a traffic light.
;

(check-expect (render RED-LIGHT)
              (place-image/align
               RED-LIGHT
               RADIUS
               RADIUS
               'center
               'center
               MTSCN))

(define (render ws)
  (place-image/align
   ws
   RADIUS
   RADIUS
   'center
   'center
   MTSCN))

;;
; EXAMPLE USAGE:
;
;  (main RED-LIGHT)
;
(define (main ws)
  (big-bang ws
            [on-tick traffic-light-next TICK-RATE]
            [to-draw render]))

