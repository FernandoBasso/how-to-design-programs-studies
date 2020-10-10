#lang htdp/bsl
(require 2htdp/image)

;;
;; EXERCISE 22:
;; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._dr-step0%29%29
;;

(define (distance-to-origin x y)
  (sqrt (+ (sqrt x) (sqrt y))))

(distance-to-origin 3 4)

(sqrt (+ (sqrt 3) (sqrt 4)))

(sqrt (+ 1.732050807568877 2))

(sqrt 3.732050807568877)

1.9318516525781366
