#lang htdp/bsl

;; Imagine that you are designing a program to manage ticket sales for a
;; theatre. (Also imagine that the theatre is perfectly rectangular in shape!)
;;
;; Design a data definition to represent a seat number in a row, where each
;; row has 32 seats. (Just the seat number, not the row number.)

;; DATA DEFINITIONS
;; ----------------

;; SeatNum is Natural[1, 32]
;; interp. seat numbers in a row, 1 and 32 are aisle seats
(define SN1  1)    ;aisle
(define SN2 12)    ;middle
(define SN3 32)    ;aisle


#;
(define (fn-for-seat-num sn)
  (... sn))

;; Template
;;  - atomic non-distinct: Natural[1, 32]

;; FUNCTIONS
;; ---------

;; SeatNum -> Boolean
;; Produce true if the given seat number is on the aisle.
(check-expect (aisle? 1) true)
(check-expect (aisle? 15) false)
(check-expect (aisle? 32) true)

;(define (aisle? sn) false)    ;stub

;<use template from SeatNumb>
(define (aisle? sn)
  (or (= sn 1)
      (= sn 32)))


;; This was just my own experiment...

(define (middle? sn)
  (and (> sn 1)
       (< sn 32)))

(check-expect (middle? 2) true)
(check-expect (middle? 31) true)
(check-expect (middle? 1) false)
(check-expect (middle? 32) false)
