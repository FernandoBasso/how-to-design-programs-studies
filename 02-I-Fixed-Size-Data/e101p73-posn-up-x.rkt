#lang htdp/bsl

;;
; EXERCISE 73:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._ex~3aupdater1%29%29
;;

;;
; Posn Number -> Posn
; Update posn-x to n.
;
(check-expect (posn-up-x (make-posn 0 0) 13)
              (make-posn 13 0))

(check-expect (posn-up-x (make-posn 9 20) 17)
              (make-posn 17 20))

(define (posn-up-x p n)
  (make-posn n (posn-y p)))


