#lang htdp/bsl

;
; PROBLEM:
;
; You've been asked to design a program having to do with all the owls
; in the owlery.
;
; (A) Design a data definition to represent the weights of all the owls.
;     For this problem call it ListOfNumber.
; (B) Design a function that consumes the weights of owls and produces
;     the total weight of all the owls.
; (C) Design a function that consumes the weights of owls and produces
;     the total number of owls.
;


;; -----------------
;; DATA DEFINITIONS:
;; -----------------
;; ListOfNumber is one of:
;;  - empty
;;  - (cons Number ListOfNumber)
;; interp. each number in the list is an owl weight in ounces.
(define LON1 empty)
(define LON2 (cons 60 empty))
(define LON3 (cons 62 (cons 45 empty)))

#;
(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else
         (... (first lon)
              (fn-for-lon (rest lon)))]))

;; Template Rules Used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons Number ListOfNumber)
;;  - self-reference: (rest los) is ListOfNumber


;; ----------
;; FUNCTIONS:
;; ----------
;; ListOfNumber -> Number
;; Produces total weight of owls in list.
(check-expect (sum empty) 0)
; first wheight + rest of weights.
(check-expect (sum (cons 60 empty)) (+ 60 0))
; first weight + second weight + the rest of weights.
(check-expect (sum (cons 62 (cons 45 empty))) (+ 62 (+ 45 0)))

;(define (sum lon) 0)    ;stub

(define (sum lon)
  (cond [(empty? lon) 0]
        [else
         (+ (first lon)
            (sum (rest lon)))]))


;; ListOfNumber -> Natural
;; Produces total number of wheights in consumed list.
(check-expect (count empty) 0)
(check-expect (count (cons 62 empty)) (+ 1 0))
(check-expect (count (cons 62 (cons 50 empty))) (+ 1 (+ 1 0)))

;(define (count lon) 0)    ;stub

(define (count lon)
  (cond [(empty? lon) 0]
        [else
         (+ 1 (count (rest lon)))]))
