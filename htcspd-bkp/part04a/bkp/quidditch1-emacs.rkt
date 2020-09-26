#lang htdp/bsl

;
; PROBLEM:
;
; Imagine that you are designing a program that will keep track of
; your favorite Quidditch teams. (http://www.internationalquidditch.org/).
;
; Design a data definition to represent a list of Quidditch teams.
;

;
; PROBLEM:
;
; We want to know whether your list of favorite Quidditch teams includes
; UBC! Design a function that consumes ListOfString and produces true if
; the list includes "UBC".
;

;; ListOfString is one of:
;;  - empty
;;  - (cons String ListOfString)
;; interp. a list of strings
(define LOS1 empty)
(define LOS2 (cons "McGill" empty))
(define LOS3 (cons "UBC" (cons "McGill" empty)))

(define (fn-for-los los)
  (cond [(empty? los) (...)]
        [else
         (... (first los)                     ; String
              (fn-for-los (rest los)))]))     ; ListOfStrings

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons String ListOfString)
;;  - self-reference: (rest los) is ListOfString



;; ListOfString -> Boolean
;; Produce #true if the los includes "UBC".
(check-expect (contains-ubc? empty) #false)
(check-expect (contains-ubc? (cons "McGil" empty)) #false)
(check-expect (contains-ubc? (cons "UBC" empty)) #true)
(check-expect (contains-ubc? (cons "McGill" (cons "UBC" empty))) #true)

;(define (contains-ubc? los) #false)    ;stub

(define (contains-ubc? los)
  (cond [(empty? los) #false]
        [else
         (if (string=? (first los) "UBC")
             #true
             (contains-ubc? (rest los)))]))



