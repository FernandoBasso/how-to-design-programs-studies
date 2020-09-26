#lang htdp/bsl
(require 2htdp/image)

(define ROCKET (bitmap "../images/rocket.png"))

(* (image-height ROCKET) (image-width ROCKET))

(define W (image-width ROCKET))
(define H (image-height ROCKET))

;; W 28, H 42
(* W H)
;; → 1176
