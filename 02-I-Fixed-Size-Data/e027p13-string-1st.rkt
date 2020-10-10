#lang htdp/bsl

;;
;; EXERCISE 13:
;; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._fun2%29%29
;;

;;
;; Returns the first ‘1String’ of the non-empty input.
;;

(define (string-1st s)
  (if (= (string-length s) 0)
      ""
      (substring s 0 1)))

(string-1st "")

(string-1st "Lara Croft 1996")

;;
;; NOTE: ‘empty?’ on an emtpy string produce ‘#f’. It works for
;; lists, not strings.
;;

