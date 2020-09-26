#lang htdp/bsl

;; Part of a traffic sumulation.

;; Natural -> Natural
(check-expect (next-color 0) 2)
(check-expect (next-color 1) 0)
(check-expect (next-color 2) 1)

;(define (next-color c) 0)    ;stub

;(define (next-color c)       ;template
;  (... c))

(define (next-color c)
  (cond [(= c 0) 2]
        [(= c 1) 0]
        [(= c 2) 1]))


;; The signagure says “Natural”. Can I call it with 3? Or 10000? The examples
;; show only 0, 1 and 2...
;; Why giving the function 0, it produces 2? What is really going on?


