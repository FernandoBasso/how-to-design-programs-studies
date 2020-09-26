#lang htdp/bsl

;; ListOfNumber is one of:
;; - empty
;; - (cons Number ListOfNumber)
;; Interp. a list of numbers.

(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else
         (... (first lon)
              (fn-for-lon (rest lon)))]))

