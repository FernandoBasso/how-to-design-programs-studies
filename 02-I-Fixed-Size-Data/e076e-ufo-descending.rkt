#lang htdp/bsl
(require 2htdp/image)
(require 2htdp/universe)

;
; UFO landing example.
;

;;
; A WorldState falls into one of three intervals:
; - Between 0 and CLOSE;
; - Between CLOSE and HEIGHT;
; - Below HEIGHT.
;;

;
; Distances in terms of pixels.
;

;;
; Width and height of the canvas.
;
(define WIDTH 300)
(define HEIGHT 100)
(define CLOSE (/ HEIGHT 3))

(define MTSCN (empty-scene WIDTH HEIGHT))

(define UFO (overlay/offset
             (circle 10 'solid 'green)
             0 20
             (circle 20 'solid 'green)))

;;
; WorldState -> WorldState
;
; USAGE:
;
;   (main 0)
;
(define (main y0)
  (big-bang y0
            [on-tick nxt]
            [to-draw render/status]))

;;
; WorldState -> WorldState
; Computes next location of UFO.
;
(check-expect (nxt 11) (+ 11 3))

(define (nxt y)
  (+ y 3))

;;
; WorldState -> Image
; Places UFO at given height into the center of MTSCN.
;
(check-expect
 (render 11)
  (place-image UFO (* 1/2 WIDTH) 11 MTSCN))

(define (render w)
  (place-image UFO (* 1/2 WIDTH) w MTSCN))

;;
; WorldState -> Image
; Adds a status line to the scene created by ‘render’.
;
(check-expect
 (render/status 10)
 (place-image
  (text "descending" 11 'green)
  30 15
  (render 10)))

(check-expect
 (render/status 60)
 (place-image
  (text "closing in" 11 'orange)
  30 15
  (render 60)))

(check-expect
 (render/status 101)
 (place-image
  (text "landed" 11 'red)
  30 15
  (render 101)))

(define (render/status y)
  (place-image
   (cond
     [(<= 0 y CLOSE) (text "descending" 11 'green)]
     [(and (< CLOSE y) (<= y HEIGHT)) (text "closing in" 11 'orange)]
     [(> y HEIGHT) (text "landed" 11 'red)])
   30 15
   (render y)))

;;
; 10 10 is repeated to many times. What if we need to change
; the status line position‽ The version above uses ‘cond’
; _inside_ ‘place-image’. Clever!
#;
(define (render/status y)
  (cond
    [(<= 0 y CLOSE)
     (place-image (text "descending" 11 'green)
                  10 10
                  (render y))]
    [(<= CLOSE y (- HEIGHT 1))
     (place-image (text "closing in" 11 'orange)
                  10 10
                  (render y))]
    [(>= y HEIGHT)
     (place-image (text "landed" 11 'red)
                  10 10
                  (render y))]))

