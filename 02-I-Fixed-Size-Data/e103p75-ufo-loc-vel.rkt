#lang htdp/bsl

;;
; EXERCISE 75:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._ex~3atry-it-out%29%29
;;

(define-struct vel [deltax deltay])
; A Vel is a structure:
;   (make-vel dx dy)
; INTERP (make-vel x y) is moving x horizontally and y vertically.
;;

(define-struct ufo [loc vel])
; A UFO is a structore:
;   (make-ufo Posn Vel)
; INTERP: (make-ufo p v) is at location p moving at velocity v.
;;

(define v1 (make-vel 8 -3))
(define v2 (make-vel -5 -3))

(define p1 (make-posn 22 80))
(define p2 (make-posn 30 77))

(define u1 (make-ufo p1 v1))
(define u2 (make-ufo p1 v2))
(define u3 (make-ufo p2 v1))
(define u4 (make-ufo p2 v2))

;;
; UFO -> UFO
; Determines where u moves in one clock tick.
; Leaves velocity as is.
;
(check-expect (ufo-move-1 u1) u3)
(check-expect (ufo-move-1 u2)
              (make-ufo (make-posn 17 77) v2))

(define (ufo-move-1 u)
  (make-ufo (posn+ (ufo-loc u) (ufo-vel u))
            (ufo-vel u)))

;;
; Posn Vel -> Posn
; Adds v to p
;
; NOTE: In geometry, the operation corresponding to posn+ is called a
; translation.
;
(check-expect (posn+ p1 v1) p2)
(check-expect (posn+ p1 v2) (make-posn 17 77))

(define (posn+ p v)
  (make-posn (+ (posn-x p) (vel-deltax v))
             (+ (posn-y p) (vel-deltay v))))

