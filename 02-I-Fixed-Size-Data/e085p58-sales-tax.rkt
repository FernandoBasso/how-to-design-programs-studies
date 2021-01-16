#lang htdp/bsl

;
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._cond9%29%29
;
; Exercise from a WIP “sales tax” program from 4.6 Designing With
; Itemizations.
;

(define LOW_PRICES 1000)
(define LUXURY_PRICES 10000)

;
; NOTE: The exercise doesn't ask for constants for the tax percentage
; itself. That is, no constants for 0, 0.05 and 0.08. I'll add them
; nonetheless.
;
(define LOW_PRICES_TAX 0)
(define MEDIUM_PRICES_TAX 0.05)
(define LUXURY_PRICES_TAX 0.08)

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
(check-expect (sales-tax 0) (* LOW_PRICES_TAX 0))
(check-expect (sales-tax 537) (* LOW_PRICES_TAX 537))
(check-expect (sales-tax 999) (* LOW_PRICES_TAX 999))

(check-expect (sales-tax 1000) (* MEDIUM_PRICES_TAX 1000))
(check-expect (sales-tax 5432) (* MEDIUM_PRICES_TAX 5432))
(check-expect (sales-tax 9999) (* MEDIUM_PRICES_TAX 9999))

(check-expect (sales-tax 10000) (* LUXURY_PRICES_TAX 10000))
(check-expect (sales-tax 12017) (* LUXURY_PRICES_TAX 12017))

(define (sales-tax p)
  (cond
    [(and (<= 0 p) (< p LOW_PRICES)) 0]
    [(and (<= LOW_PRICES p) (< p LUXURY_PRICES)) (* MEDIUM_PRICES_TAX p)]
    [(>= p LUXURY_PRICES) (* LUXURY_PRICES_TAX p)]))

