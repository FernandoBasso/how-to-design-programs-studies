#lang htdp/bsl

;; Number -> Number
;; Produces double the value it consumes.
(check-expect (double 0) 0)
(check-expect (double 4) 8)
(check-expect (double 3.3) (* 2 3.3))
(check-expect (double -1) -2)

#;
(define (double n) 0) ;stub

#;
(define (double n)   ;template
  (... n))

(define (double n)
  (* 2 n))
