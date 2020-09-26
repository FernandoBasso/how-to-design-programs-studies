#lang htdp/bsl

;; movie-starter.rkt

;; =================
;; Data definitions:

;
; PROBLEM A:
;
; Design a data definition to represent a movie, including
; title, budget, and year released.
;
; To help you to create some examples, find some interesting movie facts below:
; "Titanic" - budget: 200000000 released: 1997
; "Avatar" - budget: 237000000 released: 2009
; "The Avengers" - budget: 220000000 released: 2012
;
; However, feel free to resarch more on your own!
;



(define-struct movie (title budget year))
;; interp. Movie is (make-movie String Number Number)
(define M1 (make-movie "Titanic" 200000000 1997))
(define M2 (make-movie "Avatar" 237000000 2009))
(define M3 (make-movie "The Avengers" 220000000 2012))

(define (fn-for-movie a b)
  (... (movie-title m)    ; String
       (movie-budget m)   ; Natural
       (movie-year m)))   ; Natural

;; Template rules used:
;;  - Compound: 3 fields

;; =================
;; Functions:

;
; PROBLEM B:
;
; You have a list of movies you want to watch, but you like to watch your
; rentals in chronological order. Design a function that consumes two movies
; and produces the title of the most recently released movie.
;
; Note that the rule for templating a function that consumes two compound data
; parameters is for the template to include all the selectors for both
; parameters.
;


;; Movie Movie -> String
;; produces the title of the movie that was mostly recently release
(check-expect (newest-movie M3 M2) (movie-title M3))
(check-expect (newest-movie M1 M3) (movie-title M3))

(define (newest-movie m1 m2)
  (if (> (movie-year m1) (movie-year m2))
      (movie-title m1)
      (movie-title m2)))

;(define (newest-movie m1 m2) "") ;stub

#;
(define (newest-movie m1 m2)
  (... (movie-title m1)
       (movie-budget m1)
       (movie-year m1)
       (movie-title m2)
       (movie-budget m2)
       (movie-budget m2)))


