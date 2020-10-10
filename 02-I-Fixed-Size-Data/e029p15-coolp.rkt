#lang htdp/bsl

;;
;; EXERCISE 15:
;; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._fun4%29%29
;;

(define (cool? sunny friday)
  (or (not sunny) friday))

(cool? #f #f)
(cool? #t #t)
(cool? #t #f)

;;
;; Boolean Implication. sunny => friday
;;

