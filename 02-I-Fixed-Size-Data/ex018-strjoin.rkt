#lang htdp/bsl
(require 2htdp/image)

;;
;; EXERCISE 18:
;; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._fun10a%29%29
;;

;;
;; Joins two strings with a “_” in between.
;;
(define (string-join s1 s2)
  (string-append s1 "_" s2))

(string-join "Tomb" "Raider")

(string-join "X" "Y")

