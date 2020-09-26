#lang htdp/bsl
;; DATA DEFINITIONS
;; ----------------

;; You are assigned to develop a system that will classify
;; buildings in downtown Vancouver based on how old they are.
;; According to city guidelines, there are three different classification levels:
;; new, old, and heritage.
;;
;; Design a data definition to represent these classification levels.
;; Call it BuildingStatus.

;; BuildingStatus is one of:
;;  - "new"
;;  - "old"
;;  - "heritage"
;; interp. the classification level
;; <examples are redundant for enumeration>
(define (fn-for-building-status bs)
  (cond [(string=? bs "new") (...)]
        [(string=? bs "old") (...)]
        [(string=? bs "heritage") (...)]))

;; Template rules used:
;; one of: 3 cases
;;   atomic distinct: "new"
;;   atomic distinct: "old"
;;   atomic distinct: "heritage"


;; FUNCTIONS
;; ---------

;; The city wants to demolish all buildings classified as "old".
;; You are hired to design a function called `demolish?`
;; that determines whether a building should be torn down or not.

;; BuildingStatus -> Boolean
;; produce true if building is classified as "old" and should be demolished
(check-expect (demolish? "new") false)
(check-expect (demolish? "old") true)
(check-expect (demolish? "heritage") false)

;(define (demolish? bs) false)    ;stub

(define (demolish? bs)
  (cond [(string=? bs "new") false]
        [(string=? bs "old") true]
        [(string=? bs "heritage") false]))

