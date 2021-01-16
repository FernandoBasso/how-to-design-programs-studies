#lang htdp/bsl

;
; https://htdp.org/2020-8-1/Book/part_one.html#%28part._sec~3adesign-itemization%29
;
; WIP from 4.6 Designing With Itemizations.
;

;;
; A Price falls into one of three intervals:
; - 0 through 999;
; - 1000 and 9999;
; - 10000 and above.
; INTERP: The price of an item.
;;

;;
; Price -> Number
; Computes the amount of tax charged for p.
;
(check-expect (sales-tax 0) 0)
(check-expect (sales-tax 537) 0)
(check-expect (sales-tax 999) 0)

(check-expect (sales-tax 1000) (* 0.05 1000))
(check-expect (sales-tax 5432) (* 0.05 5432))
(check-expect (sales-tax 9999) (* 0.05 9999))

(check-expect (sales-tax 10000) (* 0.08 10000))
(check-expect (sales-tax 12017) (* 0.08 12017))

(define (sales-tax p)
  (cond
    [(and (<= 0 p) (< p 1000)) 0]
    [(and (<= 1000 p) (< p 10000)) (* 0.05 p)]
    [(>= p 10000) (* 0.08 p)]))

