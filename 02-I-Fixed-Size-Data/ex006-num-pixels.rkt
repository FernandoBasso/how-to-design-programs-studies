#lang htdp/bsl
(require 2htdp/image)

;;
;; Exercise 6:
;; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._arith-i1%29%29
;;

(define CAT (bitmap "../images/cat1.png"))

;;
;; Count the number of pixes in ‘img’.
;;
(define (num-pixels img)
  (* (image-width img) (image-height img)))

(num-pixels CAT)
;; → 8775

