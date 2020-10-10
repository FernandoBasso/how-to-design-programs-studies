#lang htdp/bsl
(require 2htdp/image)

;;
;; EXERCISE 9:
;; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._arith-p1%29%29
;;

;;
;; [...] Then create an expression that converts the value of in to a
;; positive number. For a String, it determines how long the String is
;; for an Image, it uses the area; for a Number, it decrements the
;; number by 1, unless it is already 0 or negative; for #true it uses
;; 10 and for #false 20.
;;

;;
;; NOTE: I made a function because I didn't want to have to keep
;; changing ‘in’ in order to test the expression.
;;
(define (conv in)
  (cond
    [(string? in) (string-length in)]
    [(image? in)
     (* (image-width in) (image-height in))]
    [(number? in)
     (if (>= in 1) (- in 1) 0)]
    [(boolean? in)
     (if in 10 20)]))

(conv "abc")
(conv "")

(conv (rectangle 3 7 'outline 'green))

(conv 2)
(conv 1)
(conv 0)

(conv #t)
(conv #f)

