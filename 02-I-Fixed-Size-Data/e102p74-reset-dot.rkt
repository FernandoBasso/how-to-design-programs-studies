#lang htdp/bsl
(require 2htdp/image)
(require 2htdp/universe)

;;
; EXERCISE 74:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._ex~3arun-mouse-program%29%29
;

(define MTS (empty-scene 100 100))
(define DOT (circle 3 'solid 'red))

;;
; A Posn represents the state of the world.
;;

;;
; Posn -> Posn
;
#;
(define (main p0)
  (big-bang p0
            [on-tick x+]
            [on-mouse reset-dot]
            [to-draw scene+dot]))

;;
; Posn Number -> Posn
; Update posn-x to n.
;
; NOTE: This function was writen in exercise 73.
;
(check-expect (posn-up-x (make-posn 0 0) 13)
              (make-posn 13 0))

(check-expect (posn-up-x (make-posn 9 20) 17)
              (make-posn 17 20))

(define (posn-up-x p n)
  (make-posn n (posn-y p)))

;;
; Posn -> Posn
; Increase the x-coord of p by 3.
;
; NOTE: We define x+ in terms of posn-up-x.
;
(check-expect (x+ (make-posn 0 50))
              (make-posn 3 50))

(check-expect (x+ (make-posn 43 7))
              (make-posn 46 7))

(define (x+ p)
  (posn-up-x p (+ (posn-x p) 3)))

#;
(define (x+ p)
  (make-posn (+ (posn-x p) 3) (posn-y p)))

;;
; Posn Number Number MouseEvent -> Posn
; For mouse clicks, (make-posn mouse-x mouse-y); otherwise p.
;
; This is from exercise 74.
;
(check-expect
 (reset-dot (make-posn 10 20) 29 31 "button-down")
 (make-posn 29 31))

(check-expect
 (reset-dot (make-posn 10 20) 29 31 "button-up")
 (make-posn 10 20))

(define (reset-dot p mx my me)
  (cond
    [(string=? me "button-down") (make-posn mx my)]
    [else p]))

;;
; Posn -> Image
; Adds a red spot to MTS at p.
;
(check-expect (scene+dot (make-posn 10 20))
              (place-image DOT 10 20 MTS))

(check-expect (scene+dot (make-posn 88 73))
              (place-image DOT 88 73 MTS))

(define (scene+dot p)
  (place-image DOT (posn-x p) (posn-y p) MTS))

