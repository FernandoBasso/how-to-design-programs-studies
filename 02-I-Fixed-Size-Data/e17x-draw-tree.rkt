#lang htdp/bsl
(require 2htdp/image)

;;
;; Exercise 5:
;; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._arith-i2%29%29
;;

(define W 200)
(define H W)

(define MTSCN (empty-scene W H))

(define TRUNK
  (rectangle (* W 1/10) (* H 1/2) 'solid 'brown))

(define TREETOP
  (circle (* W 1/3) 'solid 'green))

(define TREE
  (overlay/offset
   TREETOP
   0
   (/ H 3)
   TRUNK))

(overlay/align
 'center 'bottom TREE MTSCN)

