#lang htdp/bsl

;;
; EXERCISE 82
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._struct11b%29%29
;;

;;
; A Word3l is one of:
; • Three lowercase 1String ["a", "z"];
; • #f
; INTERP: A Word is spelled with tree lowercase letters from "a" to
; "z" or #f when not conformant to that criteria.
;
; A Word3l is a structure with three parts:
;   (make-word3l [1String 1String 1String]
; INTERP: A word containing the three letters.
;
(define-struct w3l [s1 s2 s3])

;;
; Some examples of Word3l:
;
(define cdn (make-w3l "c" "d" "n"))
(define php (make-w3l "p" "h" "p"))
(define rkt (make-w3l "r" "k" "t"))
(w3l-s1 rkt)
(w3l-s2 rkt)
(w3l-s3 rkt)
; → "r"
; → "k"
; → "t"

;;
; Word3l Word3l -> Word3l
; INTERP: Produces w1 if equal to w2.
;
(check-expect
 (compare-word
  (make-w3l "r" "k" "t")
  (make-w3l "p" "h" "p"))
 (make-w3l #f #f #f))

(check-expect
 (compare-word
  (make-w3l "r" "k" "t")
  (make-w3l "p" "k" "t"))
 (make-w3l #f "k" "t"))

(check-expect
 (compare-word
  (make-w3l "r" "k" "t")
  (make-w3l "r" "x" "t"))
 (make-w3l "r" #f "t"))

(check-expect
 (compare-word
  (make-w3l "r" "k" "t")
  (make-w3l "r" "k" "z"))
 (make-w3l "r" "k" #f))

(check-expect
 (compare-word
  (make-w3l "r" "k" "t")
  (make-w3l "r" "k" "t"))
 (make-w3l "r" "k" "t"))

#;
(define (compare-word w1 w2)
  (... (... (w3l-s1 w1) (w3l-s1 w2) ...)
       (... (w3l-s2 w1) (w3l-s2 w2) ...)
       (... (w3l-s3 w1) (w3l-s3 w2) ...)))

(define (compare-word w1 w2)
  (make-w3l
   (if (string=? (w3l-s1 w1) (w3l-s1 w2)) (w3l-s1 w1) #f)
   (if (string=? (w3l-s2 w1) (w3l-s2 w2)) (w3l-s2 w1) #f)
   (if (string=? (w3l-s3 w1) (w3l-s3 w2)) (w3l-s3 w1) #f)))

