#lang htdp/bsl
(require 2htdp/image)

;;
;; EXERCISE 20:
;; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._fun10c%29%29
;;

(define (string-delete s i)
  (string-append
   (substring s 0 i)
   (substring s (+ i 1))))

(string-delete "Hey" 0)

(string-delete "Hey" 1)

(string-delete "Hey" 2)

;;
;; Oops. Starting index is out of range.
;;
#;
(string-delete "hey" 3)

