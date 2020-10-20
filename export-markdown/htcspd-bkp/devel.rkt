#lang htdp/bsl

(define-struct pos (x y))

(define P1 (make-pos 3 6))  ; constructor is make-pos
(define P2 (make-pos 2 8))

;; Using the selectors.
(pos-x P1) ; 3
(pos-y P2) ; 8

;; predicate
(pos? P1)      ; true
(pos? "hello") ; false
