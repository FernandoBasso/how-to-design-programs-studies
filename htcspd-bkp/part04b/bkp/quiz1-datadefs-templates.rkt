;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname quiz1-datadefs-templates) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; =========================================================
;; ListA is one of:
;; - empty
;; - (cons "yes" ListA)
;; - (cons "no"  ListA)
;; Interp. ???

;; Template 1
(define (fn-for-listX l)
  (cond [(empty? (rest l)) (...)]
        [else
         (... (first l)
              (fn-for-listX (rest l)))]))

;; =========================================================
;; ListB is one of:
;; - empty
;; - (cons String ListB)
;; Interp. ???


;; Template 3
(define (fn-for-listX l)
  (cond [(empty? l) (...)]
        [else
         (... (first l)
              (fn-for-listX (rest l)))]))

;; =========================================================
;; ListC is one of:
;; - (cons String empty)
;; - (cons String ListC)
;; Interp. ???

;; Template 2
(define (fn-for-listX l)
  (cond [(empty? l) (...)]
        [(??? ???) (... (first l)
                        (fn-for-listX (rest l)))]
        [else
         (... (first l)
              (fn-for-listX (rest l)))]))

