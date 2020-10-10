#lang htdp/bsl

;;
;; Exercise 1:
;; https://htdp.org/2020-8-1/Book/part_one.html#(counter._(exercise._arith-n))
;;

(define x 3)
(define y 4)

(define (f x y)
  (sqrt (+ (expt x 2) (expt y 2))))

(f x y)

(f 12 5)

