#lang htdp/bsl
(require 2htdp/image)

;
; EXERCISE 36:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._design3%29%29
;

;;
; Image -> Number
; Calculates the area of an image in pixels.
;
; given:
;  (rectangle 3 4 'solid 'blue)
; expect: 12
;
(define (image-area img)
  (* (image-width img) (image-height img)))

(image-area (rectangle 3 4 'solid 'blue))
(image-area (rectangle 0 0 'solid 'blue))

