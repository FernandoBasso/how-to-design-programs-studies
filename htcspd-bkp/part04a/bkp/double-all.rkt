#lang htdp/bsl

;; =================
;; Data definitions:

;; ListOfNumber is one of:
;;  - empty
;;  - (cons Number ListOfNumber)
;; interp. a list of numbers
(define LON1 empty)
(define LON2 (cons 60 (cons 42 empty)))
#;
(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else
         (... (first lon)
              (fn-for-lon (rest lon)))]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons Number ListOfNumber)
;;  - self-reference: (rest lon) is ListOfNumber

;; =================
;; Functions:

;
; PROBLEM:
;
; Design a function that consumes a list of numbers and doubles every number
; in the list. Call it double-all.
;
(check-expect (double-all empty) empty)
(check-expect (double-all (cons 3 empty)) (cons (* 2 3) empty))
(check-expect (double-all (cons -5 (cons 24 empty))) (cons (* 2 -5) (cons (* 2 24) empty)))

;(define (double-all lon) empty)    ;stub

(define (double-all lon)
  (cond [(empty? lon) empty]
        [else
         (cons (* 2 (first lon))
               (double-all (rest lon)))]))
