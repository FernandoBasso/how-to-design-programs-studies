#lang htdp/bsl
(require 2htdp/universe)
(require 2htdp/image)

;
; EXERCISE 36:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._.D.K._%28exercise._design6%29%29
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PHYSICAL CONSTANTS
;

;;
; All parts scaling depend on this.
(define WHEEL-RADIUS 8)

; <1>
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; GRAPHICAL CONSTANTS
;

(define WHEEL
  (circle WHEEL-RADIUS 'solid 'black))

(define SPACE
  (rectangle WHEEL-DISTANCE WHEEL-RADIUS 'solid 'white))

(define BOTH-WHEELS
  (beside WHEEL SPACE WHEEL))

(define CAR-TOP (rectangle
                 (* WHEEL-RADIUS  6)
                 (* WHEEL-RADIUS 3)
                 'solid
                 'red))

(define CAR-BOT (rectangle
                 (* WHEEL-RADIUS 12)
                 (* WHEEL-RADIUS 2)
                 'solid
                 'red))

(define CAR-BODY (overlay/align 'center 'bottom CAR-TOP CAR-BOT))

(overlay/offset
 CAR-BODY
 0
 (* WHEEL-RADIUS 1.5)
 BOTH-WHEELS)

