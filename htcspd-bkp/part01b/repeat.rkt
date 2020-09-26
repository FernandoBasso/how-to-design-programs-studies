;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname repeat) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; String -> String
;; Duplicate a string (add a space and then a string itself). "" produces "".
(check-expect (repeat "foo") "foo foo")
(check-expect (repeat "") "")

;(define (repeat str) "")   ;stub

;(define (repeat str)       ;template
;  (... str))

(define (repeat str)
  (if (string=? str "")
      ""
      (string-append str " " str)))