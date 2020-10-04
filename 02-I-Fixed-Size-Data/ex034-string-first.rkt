#lang htdp/bsl

;;
;; EXERCISE 34:
;; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._design1%29%29
;;

; String -> 1String
; Extracts the first character from a string.
;
; ASSUME: string is not empty.
;
; given: "hey"; expect: "h"
(define (string-first s)
  (substring s 0 1))

(string-first "hey")
(string-first "Tomb Raider I 1996")

