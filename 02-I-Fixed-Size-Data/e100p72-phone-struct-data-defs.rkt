#lang htdp/bsl

;(define-struct ball [loc vel])
; A Ball-1d is a structure:
;   (make-ball Number Number)
; INTERP 1: Distance to top and velocity.
; INTERP 2: Distance to left and velocity.


(define-struct ball [loc vel])
; A Ball-2d is a structure:
;   (make-ball Posn Vel)
; INTERP: A 2-dimensional position and velocity
;;

(define-struct vel [deltax deltay])
; A Vel is a struct:
;   (make-vel Number Number)
; INTERP: (make-vel dx dy) means a velocity of
; dx pixels [per tick] along the horizontal direction
; dy pixels [per tick] along the vertical direction.
;;

;;
; EXERCISE 72:
; https://htdp.org/2020-8-1/Book/part_one.html#(counter._(exercise._struct6))
;;

; Exercise 72. Formulate a data definition for the above phone
; structure type definition that accommodates the given examples.
;
; Next formulate a data definition for phone numbers using this
; structure type definition:
;
;    (define-struct phone# [area switch num])
;
; Historically, the first three digits make up the area code, the next
; three the code for the phone switch (exchange) of your neighborhood,
; and the last four the phone with respect to the
; neighborhood. Describe the content of the three fields as precisely
; as possible with intervals.

(define-struct phone [area number])
; A Phone is a structure:
;   (make-phone Number Number)
; INTERP: A phone record with area and number.
;;

;;
; An PhoneArea falls through the interval:
; - [1, 999]
;

;;
; A PhoneSwitch falls through the interval:
; - [1, 999]
;

;;
; A PhoneSwitch falls through the interval:
; - [1, 9999]
;

(define-struct phone# [area switch num])
; A Phone is a structure:
;   (make-phone PhoneArea PhoneSwitch PhoneNum)
; INTERP: A phone record with area, switch and number fields.
; (make-phone 321 543 6789)

;;
; NOTE: I don't know about the phone rules and didn't want to spend
; time looking for it on the web...
;;

