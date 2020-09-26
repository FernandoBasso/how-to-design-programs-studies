#lang htdp/bsl

;; --------------------------------------------------------------------------------
;; DATA DEFINITIONS
;; ================

;; You are designing a program to track a rocket's journey as it descends
;; 100 kilometers to Earth. You are only interested in the descent from
;; 100 kilometers to touchdown. Once the rocket has landed it is done.
;;
;; Design a data definition to represent the rocket's remaining descent.
;; Call it RocketDescent.

;; RocketDescent is one of:
;;  - Number(0, 100]
;;  - false
;; interp. false if rocket's descent has ended, otherwise number of
;; kilometers left to Earth.

(define RD1 100)
(define RD2 43)
(define RD3 0.5)
(define RD4 false)



(define (fn-for-rocket-descent rd)
  (cond [(and (number? rd)
              (< 0 rd)
              (<= rd 100))
         (... rd)]
        [else (...)]))


;; Template rules used:
;;  - one of: 2 cases
;;    - atomic non-distinct: Number[100, 0)
;;    - atomic distinct: false


;; --------------------------------------------------------------------------------
;; FUNCTIONS
;; =========

;; Design a function that will output the rocket's remaining descent
;; distance in a short string that can be broadcast on Twitter. When the
;; descent is over, the message should be "The rocket has landed!". Call
;; your function rocket-descent-to-msg.
;; RocketDescent -> String
;; outputs a string about the rocket's distance from touch down
(check-expect (rocket-descent-to-msg 100) "Altitude is 100 kms.")
(check-expect (rocket-descent-to-msg 43) "Altitude is 43 kms.")
(check-expect (rocket-descent-to-msg 0.5) "Altitude is 1/2 kms.")
(check-expect (rocket-descent-to-msg false) "The rocket has landed!")

;; (define (rocket-descent-to-msg rd) "")    ;stub

;; <use template from RocketDescent>
(define (rocket-descent-to-msg rd)
  (cond [(and (number? rd) (< 0 rd) (<= rd 100))
         (string-append "Altitude is " (number->string rd) " kms.")]
        [else "The rocket has landed!"]))




