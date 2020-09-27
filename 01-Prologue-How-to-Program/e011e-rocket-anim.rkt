#lang htdp/bsl
(require 2htdp/image)
(require 2htdp/universe)

;;
;; The previous versions used height, h, etc. as parameter name for
;; ‘pic-rocket’, but it is being used with ‘animate’, and what is
;; really being passed is the number of ticks, which is the time that
;; goes by.
;;
;; Also, we were using time as if it were distance. Let's fix that.
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CONSTANTS
;;
;; Properties of the “world” and the descending rocket.
;;

;;;;
;; Canvas width and height.
;;
(define WIDTH 100)
(define HEIGHT 120)

(define MTSCN (empty-scene WIDTH HEIGHT))

(define ROCKET (bitmap "../images/rocket.png"))

;;;;
;; The distance between the top of the canvas and the center point of
;; the rocket resting on the ground.
;;
(define ROCKET-CENTER-TO-TOP (- HEIGHT (/ (image-height ROCKET) 2)))

;;;;
;; The velocity. Let's move one pixel per clock tick.
;;
(define V 1)

;;;;
;; The x position on the scene.
;;
(define POS-X (/ WIDTH 2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FUNCTIONS
;;

;;;;
;; Calculates the distance from the middle of the rocket from the top
;; of the screen.
(define (distance t)
  (* V t))

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
(define (pic-rocket t)
  (cond
    [(<= (distance t) ROCKET-CENTER-TO-TOP)
     (place-image ROCKET POS-X (distance t) MTSCN)]
    [(> (distance t) ROCKET-CENTER-TO-TOP)
     (place-image ROCKET POS-X ROCKET-CENTER-TO-TOP MTSCN)]))

