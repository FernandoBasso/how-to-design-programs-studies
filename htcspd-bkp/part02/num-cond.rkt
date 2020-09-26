#lang htdp/bsl

;; Number -> String
;; Produces a string saying if a number is "positive", "negative" or "zero".
(check-expect (mag 2) "positive")
(check-expect (mag -3) "negative")
(check-expect (mag 0) "zero")


; (define (mag n) "zero)    ;stub

#;
(define (mag n)    ;template
  (... n))

#;
(define (mag n)
  (if (> n 0)
      "positive"
      (if (= n 0)
          "zero"
          "negative")))

;; The above works but it is not semantically meaningful. We mean
;; 3 _parallel_ tests, not nesting in if inside the false answer
;; of the previous if.

(define (mag n)
  (cond [(> n 0) "positive"]
        [(< n 0) "negative"]
        [else "zero"]))


;; ( . Y . ) because "boobs"
;;  \  |  /
;;   |   |
;;  /     \
;; /       \
;;     -



