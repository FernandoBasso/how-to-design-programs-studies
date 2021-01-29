#lang htdp/bsl

;;
; EXERCISE 64:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._struct2%29%29
;;

;;
; Manhattan Distance
;
; A function to calculate the manhattan distance from some point ‘p’
; to the origin.
;
(check-expect
 (mdist (make-posn 0 3)) 3)

(check-expect
 (mdist (make-posn 4 0)) 4)

(check-expect
 (mdist (make-posn 3 4))
 (+ 3 4))

(check-expect
 (mdist (make-posn 4 3))
 (+ 4 3))

(define (mdist p)
  (+ (posn-x p) (posn-y p)))

