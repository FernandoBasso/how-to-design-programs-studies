#lang htdp/bsl

;;
; Computes the distance of ap (a point) to the origin.
;
(check-expect (distance-to-0 (make-posn 0 5)) 5)
(check-expect (distance-to-0 (make-posn 7 0)) 7)
(check-expect (distance-to-0 (make-posn 3 4)) 5)
(check-expect (distance-to-0 (make-posn 8 6)) 10)
(check-expect (distance-to-0 (make-posn 5 12)) 13)

;
; The book says “For points with 0 as one of the coordinates, the
; result is the other coordinate.” But then they show a function
; definition that doesn't do that, and use the general case instead.
;

#;
(define (distance-to-0 ap)
  (cond
    [(= (posn-x ap) 0) (posn-y ap)]
    [(= (posn-y ap) 0) (posn-x ap)]
    [else (sqrt (+
                 (sqr (posn-x ap))
                 (sqr (posn-y ap))))]))

(define (distance-to-0 ap)
  (sqrt (+ (sqr (posn-x ap))
           (sqr (posn-y ap)))))

