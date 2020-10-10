#lang htdp/bsl
(require 2htdp/image)

;;
;; EXERCISE 16:
;; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._fun5%29%29
;;

(define (image-area img)
  (* (image-width img) (image-height img)))

(image-area (rectangle 20 22 'solid 'skyblue))

(image-area (rectangle 1 1 'solid 'skyblue))

