#lang htdp/bsl
(require 2htdp/image)

;;
;; EXERCISE 28:
;; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._fun6%29%29
;;

(define BASE-PRICE 5)
(define BASE-ATTENDEES 120)
(define FIXED-COST 180)
(define EXTRA-COST-PER-ATTENDEE 4/100) ; 0.04
(define AVG-ATTENDANCE-CHANGE 15)
(define CENT-10-CHANGE 1/10) ; 0.1

(define (attendees ticket-price)
  (-
   BASE-ATTENDEES
   (*
    (- ticket-price BASE-PRICE)
    (/ AVG-ATTENDANCE-CHANGE CENT-10-CHANGE))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+
   FIXED-COST
   (* EXTRA-COST-PER-ATTENDEE (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price) (cost ticket-price)))

(define (profit1 price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
     (+ 180
        (* 0.04
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price)))))))

(= (profit 1) (profit1 1))
(= (profit 2) (profit1 2))
(= (profit 3) (profit1 3))
(= (profit 4) (profit1 4))
(= (profit 5) (profit1 5))

