#lang htdp/bsl
(require 2htdp/image)

(circle 10 "solid" "red")

(rectangle 30 20 "outline" "blue")

;;
;; Draw a rectangle, and on top of that, draw a circle
;; (smaller than the rectangle).
;;
(overlay
 (circle 5 "solid" "red")
 (rectangle 20 20 "solid" "blue"))

;;
;; If we draw the ractangle of the top, it would cover
;; the circle and we would only see the rectangle.
;;
(overlay
 (rectangle 20 20 "solid" "blue")
 (circle 5 "solid" "red"))


(place-image (circle 5 "solid" "green")
             50 80
             (empty-scene 100 100))
