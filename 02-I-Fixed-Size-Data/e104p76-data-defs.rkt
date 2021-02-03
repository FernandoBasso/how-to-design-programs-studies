#lang htdp/bsl

;;
; EXERCISE 76
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._data-uni._%28exercise._struct7%29%29
;;

(define-struct movie [title producer year])
; A Movie is a structure:
;   (make-movie String String Number)
;
(define alien (make-movie "Alien" "Riddley Scott" 1979))

(define-struct phone [area number])
; A Phone is a structure:
;   (make-phone Number Number)
; INTERP: A phone record with area and number.
;
(define a-phone (make-phone 321 7654))

(define-struct person [name hair eyes phone])
; A Person is a structure:
;   (make-person String String Color Phone)
;

(define lara
  (make-person
   "Lara Croft"
   "Pony Tail"
   'brown
   (make-phone 123 4567)))

(define-struct pet [name number])
; A Pet is a structure:
;   (make-pet String Number)
;
(define kitty (make-pet "Tinny" 1))

(define-struct CD [artist title price])
; A CD is a structure:
;   (make-CD String String Number)
;
(define fnsf
  (make-CD
   "Al Di Meola, John McLaughlin, and Paco de Lucía"
   "Friday Night in San Francisco"
   "£69.95"))

;;
; These data definitions don't need the INTERPRETATION thing because
; they seem pretty straightforward. The Movie data definition makes
; use of the Phone data definition, though, and requires a little more
; attention.
;;

