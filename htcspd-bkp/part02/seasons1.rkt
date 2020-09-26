#lang htdp/bsl

;; Season is one of:
;;  - "spring"
;;  - "summer"
;;  - "fall"
;;  - "winter"
;; interp. the four seasons of the year.
;; <examples are redundant for enumeration>
#;
(define (fn-for-season s)
  (cond [(string=? "spring" s) (...)]
        [(string=? "summer" s) (...)]
        [(string=? "fall" s) (...)]
        [(string=? "winter" s) (...)]))

;; Consider the problem of designing a function called next-season
;; that takes the given season and produces the season that follows.

;; FUNCTIONS
;; ---------

;; Functions operating on enumerations should have (at least) as many
;; tests as there are cases in the enumeration.

;; Season -> Season
;; Given a Season, produces the next Season.
(check-expect (next-season "spring") "summer")
(check-expect (next-season "summer") "fall")
(check-expect (next-season "fall") "winter")
(check-expect (next-season "winter") "spring")

;(define (next-season s) "spring")    ;stub

;; <use template for Season>
(define (next-season s)
  (cond [(string=? "spring" s) "summer"]
        [(string=? "summer" s) "fall"]
        [(string=? "fall" s) "winter"]
        [(string=? "winter" s) "spring"]))
