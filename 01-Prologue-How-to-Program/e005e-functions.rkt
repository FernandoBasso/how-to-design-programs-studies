#lang htdp/bsl

(define (y x) (* x x))

(y 2)
(y 0.5)
(y 0.1)

(check-expect (triple 3) 9)

(define (triple n) (* n 3))

