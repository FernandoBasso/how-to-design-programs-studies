#lang htdp/bsl

;; Design a function that check if a car's speed is over the speed
;; limit of 110 km/hr.

;; DATA DEFINITIONS
;; ----------------

;; CarSpeed is Number[0, 200]
;; interp. the speed of a car in km/h: 0 means stopped, 200 is the maximum speed.
(define CS1 0)        ;stopped
(define CS2 60.3)     ;okay
(define CS3 110)      ;still okay
(define CS4 110.1)    ;OVER THE SPEED LIMIT

#;
(define (fn-for-speeding? cs)
  (... cs))

;; Template rules used:
;;  - atomic non-distinct: Number[0, 200]

;; FUNCTIONS
;; ---------

;; CarSpeed -> Boolean
;; Produce true if given speed is over the speed limit.
(check-expect (speeding? 0) false)
(check-expect (speeding? 60.3) false)
(check-expect (speeding? 110.00) false)
(check-expect (speeding? 110.1) true)

;(define (speeding? cs) false)    ;stub

; <use template from CarSpeed>
(define (speeding? cs)
  (> cs 110))


