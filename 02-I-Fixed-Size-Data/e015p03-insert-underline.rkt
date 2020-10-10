#lang htdp/bsl

;;
;; Exercise 3:
;; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._arith-s1%29%29
;;

(define str "helloworld")
(define i 5)

(string-append
 (substring str 0 i)
 "_"
 (substring str i (string-length str)))
