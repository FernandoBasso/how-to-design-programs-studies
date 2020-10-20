#lang htdp/bsl

;
; EXERCISE 50:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._cond2%29%29
;

;
; A simplistic representation of a traffic light.
;
; We call it “simplistic” because it does not include the “off” state,
; the “blinking red” state, or the “blinking yellow” state.
;

;;
; A TrafficLight is one of the following Strings:
; • "red"
; • "green"
; • "yellow"
;
; INTERP: The three strings represent the three possible states a
; traffic light may assume.
;

;;
; TrafficLight -> TrafficLight
; Yields the next state given the current state s.
;
(check-expect (traffic-light-next "red") "green")
(check-expect (traffic-light-next "green") "yellow")
(check-expect (traffic-light-next "yellow") "red")

(define (traffic-light-next s)
  (cond
    [(string=? "red" s) "green"]
    [(string=? "green" s) "yellow"]
    [(string=? "yellow" s) "red"]))

