#lang htdp/bsl
(require 2htdp/image)

;;
;; EXERCISE 19:
;; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._fun10b%29%29
;;

;;
;; Joins two strings with a “_” in between.
;;
;; Empty strings as input results in empty string as output no mater
;; the value of ‘i’.
;;
(define (string-insert s i)
  (cond
    [(= (string-length s) 0) ""]
    [else
     (string-append
      (substring s 0 i)
      "_"
      (substring s i))]))

(string-insert "" 3)

(string-insert "Hey" 0)

(string-insert "Hey" 1)

(string-insert "Hey" 2)

(string-insert "Hey" 3)

;;
;; Oops. Ending index is out of range.
;;
#;
(string-insert "Hey" 4)
