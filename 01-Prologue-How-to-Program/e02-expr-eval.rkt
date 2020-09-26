#lang htdp/bsl

;;
;; NOTE: Eval this yourself before running the program.
;;

(and (or (= (string-length "hello world")
            (string->number "11"))
         (string=? "hello world" "good morning"))
     (>= (+ (string-length "hello world") 60) 80))

