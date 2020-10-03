#lang htdp/bsl
(require 2htdp/batch-io)

;;
;; EXERCISE 31:
;; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._letter-writing%29%29
;;

(define IN-FST "letter-in-fst.dat")
(define IN-LST "letter-in-lst.dat")
(define IN-SIG "letter-in-sig.dat")

(define (main in-fst in-lst in-signature out)
  (write-file out
              (letter (read-file in-fst)
                      (read-file in-lst)
                      (read-file in-signature))))

(define (letter fst lst signature-name)
  (string-append
   (opening fst)
   "\n\n"
   (body fst lst)
   "\n\n"
   (closing signature-name)))

(define (opening fst)
  (string-append "Dear " fst ","))

(define (body fst lst)
  (string-append
   "We have discovered that all people with the" "\n"
   "last name " lst " have won our lottery. So, " "\n"
   fst ", " "hurry and pick up your prize."))

(define (closing signature-name)
  (string-append
   "Sincerely,"
   "\n\n"
   signature-name
   "\n"))

(main IN-FST IN-LST IN-SIG 'stdout)

