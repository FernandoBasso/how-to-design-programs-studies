#lang htdp/bsl

;
; EXERCISE 48:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._cond1%29%29
;

;;
; Example from the book.
;
(define (next traffic-light-state)
  (cond
    [(string=? "red" traffic-light-state) "green"]
    [(string=? "green" traffic-light-state) "orange"]
    [(string=? "orange" traffic-light-state) "red"]))

;;
; Example from the book.
(define (reward s)
  (cond
    [(<= 0 s 10) "bronze"]
    [(and (< 10 s) (< s 20)) "silver"]
    [else "gold"]))

;;
; Example evaluation 1
;
(reward 3)

(cond
  [(<= 0 3 10) "bronze"]
  [(and (< 10 3) (< 3 20)) "silver"]
  [else "gold"])

(cond
  [#t "bronze"]
  [(and (< 10 3) (< 3 20)) "silver"]
  [else "gold"])

"bronze"

;;
; Example evaluation 2
;
(reward 21)

(cond
  [(<= 0 21 10) "bronze"]
  [(and (< 10 21) (< 21 20)) "silver"]
  [else "gold"])

(cond
  [#f "bronze"]
  [(and (< 10 21) (< 21 20)) "silver"]
  [else "gold"])

(cond
  [(and (< 10 21) (< 21 20)) "silver"]
  [else "gold"])

(cond
  [(and #t (< 21 20)) "silver"]
  [else "gold"])

(cond
  [(and #t #f) "silver"]
  [else "gold"])

(cond
  [#f "silver"]
  [else "gold"])

(cond
  [else "gold"])

"gold"

;;
; Example evaluation 3. Actual exercise 48.
;
(reward 18)

(cond
  [(<= 0 18 10) "bronze"]
  [(and (< 10 18) (< 18 20)) "silver"]
  [else "gold"])

(cond
  [#f "bronze"]
  [(and (< 10 18) (< 18 20)) "silver"]
  [else "gold"])

(cond
  [(and (< 10 18) (< 18 20)) "silver"]
  [else "gold"])

(cond
  [(and #t (< 18 20)) "silver"]
  [else "gold"])

(cond
  [(and #t #t) "silver"]
  [else "gold"])

(cond
  [#t "silver"]
  [else "gold"])

"silver"

