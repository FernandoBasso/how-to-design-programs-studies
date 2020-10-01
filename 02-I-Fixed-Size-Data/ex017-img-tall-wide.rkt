#lang htdp/bsl
(require 2htdp/image)

;;
;; EXERCISE 17:
;; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._fun10%29%29
;;

;; The cat is 75x117 px, so it is tall.
(define CAT (bitmap "../images/cat1.png"))

;; The rectangle is 60x40 px, so it is wide.
(define RECT (rectangle 60 40 'solid 'orangered))

;; 42x42 px creates a square.
(define SQR (rectangle 42 42 'solid 'maroon))

;;
;; Determine whether the image is “tall” or “wide”.
;;
;; USAGE:
;;
;;   (img-type some-image)
;;

(define (img-type img)
  (if
   (= (image-width img) (image-height img))
   'square
   (if
    (> (image-width img) (image-height img))
    'wide
    'tall)))

(img-type CAT)

(img-type RECT)

(img-type SQR)

