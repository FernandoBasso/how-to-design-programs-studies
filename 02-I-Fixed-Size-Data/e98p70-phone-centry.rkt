#lang htdp/bsl

;;
; EXERCISE 70:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._ex~3acompute-struct1%29%29
;;

(define-struct centry [name home office cell])
; (centry-name (make-centry n h o c)) = n
; (centry-home (make-centry n h o c)) = h
; (centry-office (make-centry n h o c)) = o
; (centry-cell (make-centry n h o c)) = c

(define-struct phone [area number])
; (phone-area (make-phone a n)) = a
; (phone-number (make-phone a n)) = n

(define shriram
  (make-centry "Shriram Fisler"
               (make-phone 207 "363-2421")
               (make-phone 101 "776-1099")
               (make-phone 208 "112-9981")))

(phone-area
 (centry-office shriram))

(centry? shriram)
(posn? shriram)

