#lang htdp/bsl
(require 2htdp/universe)
(require 2htdp/image)

;;(define cw1 (ke-h cw0 "a"))
;;(define cw2 (tock cw1))
;;(define cw3 (me-h cw2 90 100 "button-down"))
;;(me-h (tock (ke-h cw0 "a")) 90 100 "button-down")


(define BACKGROUND (empty-scene 100 100))
(define DOT (circle 3 'solid 'red))

;; Places dot at y position, x-centered.
(define (main y)
  (big-bang y
            [on-tick sub1]
            [stop-when zero?]
            [to-draw place-dot-at]
            [on-key stop]))

(define (place-dot-at y)
  (place-image DOT 50 y BACKGROUND))

;; Stop no matter what key is pressed.
(define (stop y ke)
  0)

;;
;; When a key is pressed, its handler produces zero. And when
;; the state is zero, ‘stop-when’ stops the program.
;;

(main 89)

;;
;; REMEMBER: Zero causes the program to stop. So, this starts and
;; immediately stops the program as if nothing has ever happened.
;;
;(main 0)

