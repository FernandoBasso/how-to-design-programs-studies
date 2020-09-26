#lang htdp/bsl

;; ListOfNumber is one of:
;;  - empty
;;  - (cons Number ListOfNumber)
;; interp. a list of numbers
(define LON1 empty)
(define LON2 (cons 42 empty))
(define LON3 (cons 42 (cons 3 empty)))

#;
(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]              ; BASE CASE
        [else
         (... (first lon)                 ; Number
              (fn-for-lon (rest los)))])) ; NATURAL RECURSION

;; Template Rules Used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons Number ListOfNumber)
;;  - self-reference: (rest lon) is ListOfNumber


;; ListOfNumber -> Number
;; Produce product of all numbers in the list.
(check-expect (product empty) 1)
(check-expect (product (cons 5 empty)) (* 5 1))
(check-expect (product (cons 5 (cons -2 empty))) (* 5 -2 1))

;(define (product lon) 0)    ;stub

(define (product lon)
  (cond [(empty? lon) 1]                 ; BASE CASE
        [else
         (* (first lon)                  ; Number
            (product (rest lon)))]))     ; NATURAL RECURSION
