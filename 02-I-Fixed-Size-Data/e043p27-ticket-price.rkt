#lang htdp/bsl

;;
;; EXERCISE 27:
;; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._fun6-constant%29%29
;;

(define BASE-PRICE 5)
(define BASE-ATTENDEES 120)
(define FIXED-COST 180)
(define EXTRA-COST-PER-ATTENDEE 0.04)
(define AVG-ATTENDANCE-CHANGE 15)

(define (attendees ticket-price)
  (-
   BASE-ATTENDEES
   (*
    (- ticket-price BASE-PRICE)
    (/ AVG-ATTENDANCE-CHANGE 0.1))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ FIXED-COST (* EXTRA-COST-PER-ATTENDEE (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price) (attendees ticket-price)))

;; If we charge $5.10 per ticket.
(profit 5.1)

;; If we charge $4.90 per ticket.
(profit 4.9)

