#lang htdp/bsl
(require 2htdp/image)

;;
;; EXERCISE 25:
;; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._dr-step10%29%29
;;

#;
(define (image-classify img)
  (cond
    [(>= (image-height img) (image-width img)) "tall"]
    [(= (image-height img) (image-width img)) "square"]
    [(<= (image-height img) (image-width img)) "wide"]))

;;
;; The bug is the use of both ‘>=’ and ‘<=’ which causes the
;; function to never produce “wide”.
;;

(define (image-classify img)
  (cond
    [(> (image-height img) (image-width img)) "tall"]
    [(= (image-height img) (image-width img)) "square"]
    [(< (image-height img) (image-width img)) "wide"]))

(image-classify (rectangle 4 4 'outline 'skyblue))
