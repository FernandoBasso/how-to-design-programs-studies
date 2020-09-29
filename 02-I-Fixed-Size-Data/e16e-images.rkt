#lang htdp/bsl
(require 2htdp/image)

(define SQR1 (rectangle 60 60 "solid" "orangered"))

(define SQR2 (rectangle 30 30 "solid" "green"))

(scene+line SQR1 0 0 60 60 "yellow")

(scene+line (circle 50 "solid" "green")
            50 0 50 100 'yellow)

(scene+line
 (rectangle 100 100 'solid 'darkolivegreen)
 25 25 100 100
 (make-pen 'goldenrod 30 'solid 'round 'round))

