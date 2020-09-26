#lang htdp/bsl

;; DESIGN function that consumes a string and determines whether its length is
;; less than 5.  Follow the HtDF recipe and leave behind commented out versions 
;; of the stub and template.

;; String -> Boolan
;; Produces #true if length of input string is less than 5.
(check-expect (str-less-than-5? "hey") true)
(check-expect (str-less-than-5? "may the force") false)
(check-expect (str-less-than-5? "") true)

;(define (str-less-than-5 str) false)		;stub

;(define (str-less-than-5 str)			;template
;  (... str))

(define (str-less-than-5? str)
  (< (string-length str) 5))



