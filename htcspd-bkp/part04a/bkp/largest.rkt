#lang htdp/bsl

;; =================
;; Data definitions:

;; ListOfNumber is one of:
;;  - empty
;;  - (cons Number ListOfNumber)
;; interp. a list of numbers
(define LON1 empty)
(define LON2 (cons 5 empty))
(define LON3 (cons 60 (cons 42 empty)))
(define LON4 (cons 7 (cons 1 (cons 3 empty))))

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
; Design a function that consumes a list of numbers and produces the largest number
; in the list. You may assume that all numbers in the list are greater than 0. If
; the list is empty, produce 0.
;
(check-expect (largest empty) 0)
(check-expect (largest (cons 7 empty)) 7)
;; And three tests where the greates appear as the first, then
;; "in the middle", then as the last one.
(check-expect (largest (cons 7 (cons 4 (cons 1 empty)))) 7)
(check-expect (largest (cons 1 (cons 7 (cons 4 empty)))) 7)
(check-expect (largest (cons 4 (cons 1 (cons 7 empty)))) 7)

;(define (largest lon) empty)    ;stub

#;
;; My Solution
(define (largest lon)
  (cond [(empty? lon) 0]
        [else
         (if (empty? (rest lon))
             (first lon)
             (if (> (first lon) (largest (rest lon)))
                 (first lon)
                 (largest (rest lon))))]))

;; Their solution (better indeed).
(define (largest lon)
  (cond [(empty? lon) 0]
        [else
         (if (> (first lon) (largest (rest lon)))
             (first lon)
             (largest (rest lon)))]))

