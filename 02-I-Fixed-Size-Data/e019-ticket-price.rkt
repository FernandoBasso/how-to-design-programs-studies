#lang htdp/bsl

(define PRICE 5.1)

;; Book's version in code looks different than the version
;; of the math formula.
(- 120 (* (- PRICE 5.0) (/ 15 0.1)))

;; But it _can_ be written like the math formula.
(- 120 (* (/ (- PRICE 5.0) 0.1) 15))


(define (attendees ticket-price)
  (- 120 (* (- ticket-price 5.0) (/ 15 0.1))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ 180 (* 0.04 (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price) (attendees ticket-price)))

;; If we charge $5.10 per ticket.
(profit 5.1)

;; If we charge $4.90 per ticket.
(profit 4.9)

