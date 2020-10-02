#lang htdp/bsl

;;
;; EXERCISE 26:
;; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._dr-step10b%29%29
;;

(define (string-insert s i)
  (string-append (substring s 0 i)
                 "_"
                 (substring s i)))
 
(string-insert "helloworld" 6)

;;
;; It produces “hellow_orld”. Got it right after careful examination.
;;
