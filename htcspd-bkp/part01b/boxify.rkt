#lang htdp/bsl
(require 2htdp/image)
;; Design a function that consumes an image, and appears to put a box around it.
;; Image -> Image
;; Add input image "inside" a box 5px wider and higher than the input image.
(check-expect (boxify (rectangle 10 15 "solid" "blue"))
                      (overlay (rectangle 15 20 "outline" "black")
                               (rectangle 10 15 "solid" "blue")))

(check-expect (boxify (ellipse 80 50 "solid" "red"))
                      (overlay (rectangle 85 55 "outline" "black")
                               (ellipse 80 50 "solid" "red")))

#;
(define (boxify img) (rectangle 10 15 "outline" "black"))    ;stub

#;
(define (boxify img)  ;template
  (... img))

(define (boxify img)
  (overlay (rectangle
            (+ (image-width img) 5)
            (+ (image-height img) 5)
            "outline"
            "black")
           img))
