#lang htdp/bsl

;;
; EXERCISE 66:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._struct3b%29%29
;;

(define-struct movie [title producer year])
(define alien (make-movie "Alien" "Riddley Scott" 1979))
(movie? alien)
(movie-title alien)
(movie-producer alien)
(movie-year alien)

(define-struct person [name hair eyes phone])
(define lara
  (make-person "Lara Croft" "Ponny Tail" 'brown "101-0101"))
(person-name lara)
(person-hair lara)
(person-eyes lara)
(person-phone lara)


(define-struct pet [name number])
(define kitty (make-pet "Tinny" 1))
(pet-name kitty)
(pet-number kitty)

(define-struct CD [artist title price])
(define fnsf
  (make-CD
   "Al Di Meola, John McLaughlin, and Paco de Lucía"
   "Friday Night in San Francisco"
   "£69.95"
   ))
(CD-artist fnsf)
(CD-title fnsf)
(CD-price fnsf)

