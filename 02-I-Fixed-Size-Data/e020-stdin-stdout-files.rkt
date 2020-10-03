#lang htdp/bsl
(require 2htdp/batch-io)

(write-file "sample.dat" "42")

(read-file "sample.dat")

(write-file 'stdout "42\n")

;(read-file 'stdin)

(define (C f)
  (* 5/9 (- f 32)))

(define (convert in out)
  (write-file
   out
   (string-append
    (number->string
     (C
      (string->number
       (read-file in))))
    "\n")))

(convert "32.dat" 'stdout)
