#lang htdp/bsl
(require 2htdp/image)
(require 2htdp/universe)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CONSTANTS

;;;;
;; Canvas width and height.
;;
(define WIDTH 200)
(define HEIGHT 100)

(define CENTER-X (/ WIDTH 2))
(define CENTER-Y (/ HEIGHT 2))

(define MTSCN  (empty-scene WIDTH HEIGHT))

(define BACKGROUND (rectangle WIDTH HEIGHT "solid" "blue"))

(define ROCKS-HEIGHT 22)

(define ROCKS (rectangle WIDTH ROCKS-HEIGHT "solid" "gray"))

(define BLUISH-SCENE
  (place-image
   (overlay/align "middle"
                  "bottom"
                  ROCKS
                  BACKGROUND)
   CENTER-X CENTER-Y MTSCN))

(define UFO (overlay (circle 10 "solid" "green")
                     (rectangle 40 4 "solid" "green")))

;;;;
;; The distance between the top of the canvas and the
;; center point of the UFO resting on the ground.
;;
(define UFO-CENTER-TO-TOP
  (- (- HEIGHT (/ (image-height UFO) 2)) ROCKS-HEIGHT))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FUNCTIONS
;;

;;;;
;; Draws a picture of a UFO at h position.
;;
;; USAGE:
;;
;;  (animate pic-UFO)
;;
(define (pic-ufo h)
  (cond
    [(<= h UFO-CENTER-TO-TOP)
     (place-image UFO CENTER-X h BLUISH-SCENE)]
    [(> h UFO-CENTER-TO-TOP)
     (place-image UFO CENTER-X UFO-CENTER-TO-TOP BLUISH-SCENE)]))

