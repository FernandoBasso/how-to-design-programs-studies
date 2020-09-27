#lang htdp/bsl

(string-append "hello" " " "world")
(string-append "hello " "world")

(+ 1 2 3)

(+ (string-length "FP") 1)

(number->string 42)

(string->number "42")

;; Produces #f.
(string->number "forty two")

(and #t #f)
(or #f #t)
(not #t)

(> 1 2)
(< -1 0)
(= 42 (string->number "42"))

"-----------------------------------"

(string=? "linux" "linuX")

