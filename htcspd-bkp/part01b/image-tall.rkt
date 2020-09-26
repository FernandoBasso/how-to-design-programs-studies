#lang htdp/bsl
(require 2htdp/image)
;; #reader(lib "htdp-beginner-reader.ss" "lang")((modname area-tests) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; DESIGN is the process of going from a poorly formed problem to a
;; well structured solution.

;; DESIGN a function that consumes an image and determines whether the 
;; image is tall.

;; What does it mean “to determine that the image is tall”? Is it tall or not?
;; Produces a boolean, it seems.

;; Image -> Boolean
;; Produce #true if the image is tall (height is greater than width).

(check-expect (tall? (rectangle 2 3 "solid" "red")) true)
(check-expect (tall? (rectangle 3 2 "solid" "red")) false)

;; What if width  and height are the same? Let’s assume in such case the
;; image is NOT tall.
;; Update  all parts (purpose, definition, etc).
(check-expect (tall? (rectangle 3 3 "solid" "red")) false)

;(define (tall? img) false)    ;stub

;(define (tall? img)          ;template
;  (... img))


;; (define (tall? img)
;;   (if (> (image-height img) (image-width img))
;;       true
;;       false))

(define (tall? img)
  (> (image-height img) (image-width img)))

