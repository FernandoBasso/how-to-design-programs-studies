#lang htdp/bsl
(require 2htdp/image)

;; image-list-starter.rkt

;; =================
;; Data definitions:

;
; PROBLEM A:
;
; Design a data definition to represent a list of images. Call it ListOfImage.
;


;; ListOfImage is one of:
;;  - empty
;;  - (cons Image ListOfImage)
;; interp. A list of images.

(define IMG1 (square 0 "solid" "black"))
(define IMG2 (square 20 "solid" "slateblue"))
(define IMG3 (rectangle 32 20 "outline" "orange"))

#;
(define (fn-for-loi loi)
  (cond [(empty? loi) (...)]
        [else
         (... (first loi)
              (fn-for-loi (rest loi)))]))

;; Template Rules Used:
;;  - one of: two cases:
;;    - atomic distinct: empty
;;    - compound: (cons Image ListOfImage)
;;  - atomic non-distinct: (first loi) is Image
;;  - self-reference: (rest loi) is ListOfImage


;; =================
;; Functions:

;
; PROBLEM B:
;
; Design a function that consumes a list of images and produces a number
; that is the sum of the areas of each image. For area, just use the image's
; width times its height.
;


(check-expect (total-area empty) 0)
(check-expect (total-area (cons
                           (square 0 "solid" "blue") empty))
              0)

(check-expect (total-area (cons
                           (rectangle 10 15 "solid" "mangenta")
                           empty))
              (* 10 15))

(check-expect (total-area (cons
                           (square 20 "solid" "gray")
                           (cons
                            (rectangle 35 25 "outline" "black")
                            empty)))
              (+ (* 20 20) (* 35 25)))


;(define (total-area loi) -1)    ;stub

(define (total-area loi)
  (cond [(empty? loi) 0]
        [else
         (+ (* (image-width (first loi)) (image-height (first loi)))
            (total-area (rest loi)))]))
