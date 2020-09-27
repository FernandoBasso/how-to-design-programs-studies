#lang htdp/bsl
(require 2htdp/image)
(require 2htdp/universe)

(define ROCKET (bitmap "../images/rocket.png"))
(define SCENE (empty-scene 100 60))

(define base (- 60 (/ (image-height ROCKET) 2)))

;;
;; Draws a picture of a rocket at h position.
;;
;; USAGE: (animate pic-rocket)
;;
(define (pic-rocket h)
  (cond
    [(<= h base) (place-image ROCKET 50 h SCENE)]
    [(> h base) (place-image ROCKET 50 base SCENE)]))
