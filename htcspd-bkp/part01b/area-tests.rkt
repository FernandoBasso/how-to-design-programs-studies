#lang htdp/bsl
;; #reader(lib "htdp-beginner-reader.ss" "lang")((modname area-tests) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; Given length of one side of square, produce the area of the square.
(check-expect (area-of-square 3) 3) ;; This test is wrong.
(check-expect (area-of-square 3.2) (* 3.2 3.2))


(define (area-of-square side)
  (* side side))

;; When you test this, the first test will fail. The function is correct, but the
;; test is expecting that the area of a square with side 3 is 3, which is incorrect;
;; 9 would be the area of such a square.
;;
;; If you change the function to conform to the test, you'll end up with a function
;; that produces incorrect values.
