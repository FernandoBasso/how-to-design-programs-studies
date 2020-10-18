#lang htdp/bsl
(require 2htdp/image)

;
; EXERCISE 49:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._cond1-nested%29%29
;

(define WIDTH 100)
(define HEIGHT 60)
(define MTSCN (empty-scene WIDTH HEIGHT))
(define ROCKET (bitmap "../images/rocket.png"))
(define ROCKET-CENTER-TO-TOP
  (- HEIGHT (/ (image-height ROCKET) 2)))

(define (create-rocket-scene.v5 h)
  (cond
    [(<= h ROCKET-CENTER-TO-TOP)
     (place-image ROCKET 50 h MTSCN)]
    [(> h ROCKET-CENTER-TO-TOP)
     (place-image ROCKET 50 ROCKET-CENTER-TO-TOP MTSCN)]))

;;
; Evaluation with 100
;
(create-rocket-scene.v5 100)

(cond
  [(<= 100 ROCKET-CENTER-TO-TOP)
   (place-image ROCKET 50 100 MTSCN)]
  [(> 100 ROCKET-CENTER-TO-TOP)
   (place-image ROCKET 50 ROCKET-CENTER-TO-TOP MTSCN)])

(cond
  [#f (place-image ROCKET 50 100 MTSCN)]
  [(> 100 ROCKET-CENTER-TO-TOP)
   (place-image ROCKET 50 ROCKET-CENTER-TO-TOP MTSCN)])

(cond
  [(> 100 ROCKET-CENTER-TO-TOP)
   (place-image ROCKET 50 ROCKET-CENTER-TO-TOP MTSCN)])

(cond
  [#t (place-image ROCKET 50 ROCKET-CENTER-TO-TOP MTSCN)])

(place-image ROCKET 50 ROCKET-CENTER-TO-TOP MTSCN)

;;
; Evaluation with 210 will just produce the same steps and result.
; I'll pass this one...


;;
; Reformulation to use only one single ‘place-imge’.
;
(define (create-rocket-scene.v6 h)
  (place-image
   ROCKET
   50
   (cond
     [(<= 100 ROCKET-CENTER-TO-TOP) 100]
     [else ROCKET-CENTER-TO-TOP])
   MTSCN))

