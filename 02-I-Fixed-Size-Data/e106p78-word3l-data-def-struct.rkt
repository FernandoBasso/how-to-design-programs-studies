#lang htdp/bsl

;;
; EXERCISE 78
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._data-uni._%28exercise._struct9%29%29
;;

;;
; A Word3l is one of:
; • Three lowercase 1String ["a", "z"];
; • #f
; INTERP: A Word is spelled with tree lowercase letters from "z" to
; "z" or #f when not conformant to that criteria.
;
; A Word3l is a structure with three parts:
;   (make-word3l [1String 1String 1String]
; INTERP: A word containing the three letters.
;
(define-struct word3l [s1 s2 s3])

;;
; Some examples of Word3l:
;
(define cdn (make-word3l "c" "d" "n"))
(define php (make-word3l "p" "h" "p"))
(define rkt (make-word3l "r" "k" "t"))
(word3l-s1 rkt)
(word3l-s2 rkt)
(word3l-s3 rkt)
; → "r"
; → "k"
; → "t"

;
; This person wrote a different structure definition. Not sure if one
; of us is more correct than the other, but why making a structure
; that just takes one single value?
;
; https://github.com/eareese/htdp-exercises/blob/master/part01-fixed-size-data/078-word-definition.rkt
;
