#lang htdp/bsl

;;
;; EXERCISE 24:
;; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._dr-step4%29%29
;;

;;
;; Logicians call this “implication”. See exercise 15.
;;

(define (==> x y)
  (or (not x) y))

(==> #t #f)

(or (not #t) #f)

(or #f #f)

#f
