#lang htdp/bsl
(require 2htdp/image)
(require 2htdp/universe)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CONSTANTS

;;;;
;; Canvas width and height.
;;
(define WIDTH 100)
(define HEIGHT 60)

(define MTSCN (empty-scene WIDTH HEIGHT))

(define ROCKET (bitmap "../images/rocket.png"))

;;;;
;; The distance between the top of the canvas and the
;; center point of the rocket resting on the ground.
;;
(define ROCKET-CENTER-TO-TOP (- HEIGHT (/ (image-height ROCKET) 2)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FUNCTIONS
;;

;;;;
;; Draws a picture of a rocket at h position.
;;
;; USAGE:
;;
;;  (animate pic-rocket)
;;
;; or
;;
;; (pic-rocket 50)
;;
(define (pic-rocket h)
  (cond
    [(<= h ROCKET-CENTER-TO-TOP)
     (place-image ROCKET 50 h MTSCN)]
    [(> h ROCKET-CENTER-TO-TOP)
     (place-image ROCKET 50 ROCKET-CENTER-TO-TOP MTSCN)]))
