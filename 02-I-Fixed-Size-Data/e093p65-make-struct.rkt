#lang htdp/bsl

;;
; EXERCISE 65:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._struct3%29%29
;;

(define-struct movie [title producer year])
(define alien (make-movie "Alien" "Riddley Scott" 1979))
(movie? alien)
(movie-title alien)
(movie-producer alien)
(movie-year alien)

(define-struct person [name hair eyes phone])
; make-person constructor
; person-name, person-hair, person-eyes, person-phone selectors
; person? predicate

(define-struct pet [name number])
; make-pet constructor
; pet-name, pet-number selectors
; pet? predicate

(define-struct CD [artist title price])
; make-CD constructor
; CD-artist, CD-title, CD-price seelctors
; CD?

(define-struct sweater [material size producer])
; make-sweater constructor
; sweater-material, sweater-size, sweater-producer selectors
; sweater? predicate

