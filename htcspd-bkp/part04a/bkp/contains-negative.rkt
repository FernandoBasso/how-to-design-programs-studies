#lang htdp/bsl

;; ListOfNumber is one of:
;;  - empty
;;  - (cons Number ListOfNumber)
;; interp. a list of numbers
(define LON1 empty)
(define LON2 (cons 1 empty))
(define LON3 (cons 2 (cons 1 empty)))

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
;;  - self-reference: (rest los) is ListOfString

;; ListOfNumber -> Boolean
;; Produce #true if a lon contains a negative number.
(check-expect (contains-negative? empty) #false)
(check-expect (contains-negative? (cons 1 empty)) #false)
(check-expect (contains-negative? (cons 1 (cons -1.5 empty))) #true)

(define (contains-negative? lon)
  (cond [(empty? lon) #false]
        [else
         (if (negative? (first lon))
             #true
             (contains-negative? (rest lon)))]))

