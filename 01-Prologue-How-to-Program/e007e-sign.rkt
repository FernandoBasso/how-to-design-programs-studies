#lang htdp/bsl

(check-expect (sign -5) -1)
(check-expect (sign 0) 0)
(check-expect (sign 3) 1)

(define (sign x)
  (cond
    [(> x 0) 1]
    [(= x 0) 0]
    [(< x 0) -1]))

