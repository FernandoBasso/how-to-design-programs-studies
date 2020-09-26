#lang htdp/bsl
(require 2htdp/image)
(require 2htdp/universe)

(define ROCKET (bitmap "../images/rocket.png"))


;(place-image ROCKET 50 20 (empty-scene 100 60))
;(place-image ROCKET 50 30 (empty-scene 100 60))
;(place-image ROCKET 50 40 (empty-scene 100 60))

(define (pic-rocket pos-y)
  (place-image
   ROCKET 50 pos-y
   (empty-scene 100 60)))

(pic-rocket 20)
(pic-rocket 30)
(pic-rocket 40)

(animate pic-rocket)
