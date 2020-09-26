#lang htdp/bsl

;; Data definitions:
;; ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

;; TLColor is one of:
;;  - 0
;;  - 1
;;  - 2
;; Interp. color of a traffic light - 0 is red, 1 yellow, 2 green.

#;
(define (fn-for-tlcolor c)
  (cond [(= c 0) (...)]
        [(= c 1) (...)]
        [(= c 2) (...)]))

;; Functions:
;; ‾‾‾‾‾‾‾‾‾‾

;; TLColor -> TLColor
;; Produce next color of traffic light.
(check-expect (next-color 0) 2)
(check-expect (next-color 1) 0)
(check-expect (next-color 2) 1)

;(define (next-color c) 0)    ;stub

;(define (next-color c)       ;template
;  (... c))

(define (next-color c)
  (cond [(= c 0) 2]
        [(= c 1) 0]
        [(= c 2) 1]))


;; This function cannot consume 3, or 10000. It consumes and
;; produces TLColor!

;; Signature plus data definition tell us what 0, 1 or 2 mean!
