#lang htdp/bsl
(require 2htdp/image)

(define MTSCN (empty-scene 400 80))

(define CARLEN 80)
(define CAR-Y 60)


(define TIRE-R (* 1/10 CARLEN))

(define TIRE (circle TIRE-R 'solid 'black))

(define BOT (rectangle CARLEN (* 1/4 CARLEN) 'solid 'red))

(define TOP (rectangle (* 1/2 CARLEN) (* 2/5 CARLEN) 'solid 'red))

(define CAR-BODY (overlay/align 'center 'bottom TOP BOT))

(define CAR (overlay/offset
   (overlay/offset
    CAR-BODY
    (* 1/5 CARLEN)
    (* TIRE-R 2)
    TIRE)
   (* (* 1/5 CARLEN) -1) (- (* TIRE-R 2) (/ TIRE-R 2)) TIRE))

(define (render x)
  (place-image CAR x CAR-Y MTSCN))

(render 333)

(check-expect
 (render 40)
 (place-image CAR 40 CAR-Y (empty-scene 400 80)))

(check-expect
 (render 87)
 (place-image CAR 87 CAR-Y (empty-scene 400 80)))

