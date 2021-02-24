#lang htdp/bsl

;;
; Design a function that computes the distance of objects in a
; 3-dimensional space to the origin.
;;

;;
; An R3 is a structure:
;   (make-r3 Number Number Number)
;
; INTERP: A 3-dimensional object containing x, y and z axes.
;
(define-struct r3 [x y z])

(define ex0 (make-r3 0 0 0))
(define ex1 (make-r3 1 2 13))
(define ex2 (make-r3 -1 0 3))

;;
; R3 -> Number
; Determines the distance of p to the origin.
;
(check-expect
 (dist-to-0 ex0)
 0)

(check-within
 (dist-to-0 ex1)
 (sqrt (+ (expt 1 2) (expt 2 2) (expt 13 2))) ; #i13.19...
 #i13.18)

(check-within
 (dist-to-0 ex2)
 (sqrt (+ (expt -1 2) (expt 0 2) (expt 3 2))) ; #i3.162...
 #i3.16)

(define (dist-to-0 p)
  (sqrt (+ (expt (r3-x p) 2)
           (expt (r3-y p) 2)
           (expt (r3-z p) 2))))

;;
; NOTE: Cannot compare inexact numbers with ‘check-expect’. For those,
; we need ‘check-within’:
;
; https://docs.racket-lang.org/htdp-langs/beginner.html#%28form._%28%28lib._lang%2Fhtdp-beginner..rkt%29._check-within%29%29
;;
