#lang htdp/bsl

;; Using the CityName data definition below design a function
;; that produces true if the given city is the best in the world.
;; (You are free to decide for yourself which is the best city
;; in the world.)

;; DATA DEFINITIONS:
;; -----------------

;; CityName is String
;; interp. the name of a city
(define CN1 "Boston")
(define CN2 "Vancouver")


#;
(define (fn-for-city-name cn)
  (... cn))

;; Template rules used:
;; - atomic non-distinct: String

;; FUNCTIONS:
;; ----------

;; CityName -> Boolean
;; produce true if the given city is Hogsmeade
(check-expect (best? "Boston") false)
(check-expect (best? "Hogsmeade") true)

;(define (best? cn) false)	;stub

; took tamplate from CityName
(define (best? cn)
  (string=? cn "Hogsmeade"))









