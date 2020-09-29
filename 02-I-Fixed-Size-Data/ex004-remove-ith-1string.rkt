#lang htdp/bsl

;;
;; Exercise 4:
;; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._arith-s2%29%29
;;

(define str "hello-world")

;;
;; ASUME: ‘i’ is less than the length of the string.
;;
(define i 5)

;;
;; Remove 1String at position i.
;;
(string-append
 (substring str 0 i)
 (substring str (+ i 1) (string-length str)))

