#lang htdp/bsl

;;
;; The inverse of ‘x’. Prevents division by zero.
;;
;; USAGE:
;;
;;   (inv-x 0.2)
;;   (inv-x 2)
;;
(define (inv-x x)
  (if (= x 0) 0 (/ 1 x)))

;;
;; EVALUTATION STEPS
;;

(inv-x 0)

(if (= 0 0) 0 (/ 1 0))

(if #t 0 (/ 1 0))

0

