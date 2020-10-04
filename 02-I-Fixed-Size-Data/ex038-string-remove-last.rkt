#lang htdp/bsl

;
; EXERCISE 38:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._design5%29%29
;

;;
; String -> String
; Removes the last character of a string.
;
; given: "hey"; expect: "he"
; given: "λ"; expect: ""
; given: ""; expect: ""
;
(define (string-remove-last s)
  (if
   (= (string-length s) 0)
   ""
   (substring s 0 (- (string-length s) 1))))

(string-remove-last "")
(string-remove-last "‽")
(string-remove-last "Tomb Raider IV - The Last Revelation")

