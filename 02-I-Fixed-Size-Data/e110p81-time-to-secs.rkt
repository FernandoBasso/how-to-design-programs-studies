#lang htdp/bsl

;;
; EXERCISE 81
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._struct11a%29%29
;;

;;
; An Hour is the interval:
; • a number between 0 and 23, that is, [0, 23].
;;

;;
; A Minute is the interval:
; • a number between 0 and 59, that is, [0, 59].
;;

;;
; A Second is the interval:
; • a number between 0 and 59, that is, [0, 59].
;;

; A Time is a structure:
;   (make-time Hour Minute Second)
;
; INTERP: A point in time since midnight.
;
(define-struct time [h m s])


;;
; The deploy will start at midnight.
;
(define deploy (make-time 0 0 0))

;;
; Time to wake up and do some exercises everyday.
;
(define workout (make-time 5 45 0))

;;
; Time to start reading before sleeping at night.
;
(define read (make-time 21 15 45))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; An alternative definition could be something like the following.
;

;;
; A TimePoint represents a point in time since midnight.
;   (make-tp Number Number Number)
; A TimePoint has three parts:
; • h, a Number representing hours, [0, 23].
; • m, a Number representing seconds, [0, 59].
; • s, a Number representing seconds [0, 59].
;
(define-struct tp [h m s])


;;
; TimePoint -> Second
; Computes the number of second in tp.
;
(check-expect
 (time->seconds (make-time 0 0 0))
 0)

(check-expect
 (time->seconds (make-time 0 0 1))
 1)

(check-expect
 (time->seconds (make-time 1 1 1))
 (+ (* 1 60 60) 60 1))

(check-expect
 (time->seconds (make-time 12 30 2))
 (+ (* 12 60 60) (* 30 60) 2))

(define (time->seconds t)
  (+ (* (time-h t) 60 60)
     (* (time-m t) 60)
     (time-s t)))

