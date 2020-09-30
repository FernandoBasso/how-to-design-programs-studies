#lang htdp/bsl

;;
;; EXERCISE 11:
;; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._fun0%29%29
;;

;;
;; Computes the distance of the point (x, y) to the origin.
;;
(define (distance-from-origin x y)
  (sqrt (+ (expt x 2) (expt y 2))))

(distance-from-origin 1 1)

(distance-from-origin 12 5)

