#lang htdp/bsl

;;
;; EXERCISE 14:
;; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._fun3%29%29
;;

;;
;; Returns the last ‘1String’ of the non-empty input.
;;

(define (string-last s)
  (if (= (string-length s) 0)
      ""
      (substring s (- (string-length s) 1) (string-length s))))

(string-last "")

(string-last "Lara Croft 1996")

;;
;; NOTE: ‘empty?’ on an emtpy string produce ‘#f’. It works for
;; lists, not strings.
;;

