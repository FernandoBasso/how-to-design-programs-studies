#lang htdp/bsl

;;
; EXERCISE 67:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._struct4%29%29
;;

;;
; Location Velocity -> Ball
;
(define-struct ball [loc vel])

(define SPEED 3)
(define-struct balld [loc vel])
(make-balld 10 "up")
(make-balld 70 "down")

(define-struct vel [deltax deltay])

(define ball1
  (make-ball
   (make-posn 30 40)
   (make-vel -10 5)))

