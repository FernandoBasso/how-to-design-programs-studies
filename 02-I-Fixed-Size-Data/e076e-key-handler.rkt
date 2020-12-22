#lang htdp/bsl

;;
; A Position is a Number
; INTERP: Distance between the left margin and the ball.
;;

;;
; Position KeyEvent -> Position
; Computes the next location of the ball.
;
(check-expect (keh 13 "left") (- 13 5))
(check-expect (keh 13 "right") (+ 13 5))
(check-expect (keh 13 "z") 13)

(define (keh p ke)
  (cond
    [(string=? ke "left") (- p 5)]
    [(string=? ke "right") (+ p 5)]
    [else p]))

