#lang htdp/bsl

;
; EXERCISE 37:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._design4%29%29
;

;;
; String -> String
; Removes the fist character of a string, returning the rest of it.
;
; given: "hey"; expect: "ey"
; given: "λ"; expect: ""
; given: ""; expect: ""
;
(define (string-rest s)
  (if
   (= (string-length s) 0)
   ""
   (substring s 1)))

(string-rest "")
(string-rest "‽")
(string-rest "Tomb Raider IV - The Last Revelation")

