#lang htdp/bsl

;;
; A NorF is one of:
; - #f
; - a Number
;;

;;
; NorF -> Number
; Adds 3 to the given number.
; #f is considered zero.
;
(check-expect (add3 #f) 3)
(check-expect (add3 0.12) (+ 0.12 3)) ; 3.12
(check-expect (add3 -42) (+ -42 3)) ; 39

(define (add3 x)
  (cond
    [(false? x) 3]
    [else (+ x 3)]))

