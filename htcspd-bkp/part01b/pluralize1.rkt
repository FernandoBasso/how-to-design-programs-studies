;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname pluralize1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Design a function that pluralizes a given word. (Pluralize
;; means to convert the word to its plural form.) For
;; simplicity you may assume that just adding s is enough to
;; pluralize a word.

;; String -> String
;; Given a singular word, pluralize it (add “s” to the end of it).
(check-expect (pluralize "car") "cars")
(check-expect (pluralize "girl") "girls")

;(define (pluralize word) "") ;stub
;
;(define (pluralize word) ;template
;  (... word))

(define (pluralize word)
  (string-append word "s"))

            