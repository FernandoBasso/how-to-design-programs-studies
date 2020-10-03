#lang htdp/bsl
(require 2htdp/universe)
(require 2htdp/image)


(define (number->square s)
  (square s 'solid 'red))

(define (reset s ke)
  100)

(big-bang 100
          [to-draw number->square]
          [on-tick sub1]
          [stop-when zero?]
          [on-key reset])

