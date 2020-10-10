#lang htdp/bsl

;;
;; EXERCISE 35:
;; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._design2%29%29
;;

; String -> 1String
; Extracts the last character of a string.
;
; ASSUME: string is not empty.
;
; given: "hey"; expect: "y"
(define (string-last s)
  (substring s (- (string-length s) 1)))

(string-last "hey")
(string-last "Tomb Raider I 1996")

