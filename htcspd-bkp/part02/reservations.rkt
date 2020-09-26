#lang htdp/bsl

;; Reservation is one of:
;;  - Natural[1, 100]
;;  - "standby"
;; interp.
;;    Natura[1, 100] means a guaranteed seat for dinner where the number
;;                   corresponds to which reservation (not which seat).
;;    "standby"      means a standby spot, if all the reservations show
;;                   up this person will not be seated.
(define R1 70)
(define R2 "standby")

#;
(define (fn-for-reservation r)
  (cond [(number? r) (... r)]
        [else (...)]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic non-distinct: Natural[1, 100]
;;  - atomic distinct: "standby"

;; Consider the problem of designing a function called seat-guaranteed?
;; that consumes a reservation and returns true if the reservation
;; guarantees a seat for dinner in the restaurant.

;; FUNCTIONS
;; ---------

;; Reservation -> Boolean
;; produce true if the reservation guarantees a seat for dinner
(check-expect (seat-guaranteed? "standby") false)
(check-expect (seat-guaranteed? 41) true)

;(define (seat-guaranteed? r) false)    ;stub

(define (seat-guaranteed? r)
  (cond [(and (number? r) (<= 1 r 100)) true]
        [else false]))
