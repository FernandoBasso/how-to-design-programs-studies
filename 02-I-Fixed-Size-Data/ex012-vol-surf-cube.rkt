#lang htdp/bsl

;;
;; EXERCISE 12:
;; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._fun1%29%29
;;

;;
;; Computes the volume of an equilateral cube.
;;
(define (cvolume len)
  (expt len 3))

(cvolume 5)

(define (csurface len)
  (* (* len len) 6))

(csurface 5)

