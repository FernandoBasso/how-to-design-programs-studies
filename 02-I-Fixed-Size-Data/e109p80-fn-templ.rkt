#lang htdp/bsl

;;
; EXERCISE 80
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._struct11%29%29
;;

(define-struct movie [title director year])

;;
; Movie -> ???
;
(define (f m)
  (... (movie-title m) ...
       (movie-director m) ...
       (movie-year m) ...))


(define-struct pet [name number])

;;
; Pet -> ???
;
(define (g p)
  (... (pet-name p) ... (pept-number p) ...))


(define-struct CD [artist title price])

;;
; CD -> ???
;
(define (h cd)
  (... (CD-artist cd) ...
       (CD-title cd) ...
       (CD-price cd) ...))


(define-struct sweater [material size color])

;;
; Sweater -> ???
;
(define (fn s)
  (... (sweater-material s) ...
       (sweater->size s) ...
       (sweater->color s) ...))

