#lang htdp/bsl
(require 2htdp/image)

; Number String Image -> Image
; Adds s to image,
; y pixels from the top and 10 from the left.
#;
(define (add-image s y)
  (empty-scene 100 100))
; given:
;   5 for y,
;   "hello" for s, and
;   (empty-scene 100 100) for img
; expect:
;   (place-image (text "hello" 10 "red") 50 5 ...)
;   where ... is (empty-scene 100 100)
(define (add-image s y img)
  (place-image (text s 16 "red") 50 y img))

(add-image "hello" 50 (empty-scene 100 100))

; Number -> Number
; Computes the area of a square with side len.
; given: 2; expect: 4.
; given: 7; expect: 49.
;(define (area-of-square len) 0)
#;
(define (area-of-square len)
  (... len ...))
(define (area-of-square len)
  (sqr len))

(area-of-square 2)
(area-of-square 7)

