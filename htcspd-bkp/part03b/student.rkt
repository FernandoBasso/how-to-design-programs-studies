#lang htdp/bsl

;; =================
;; Data definitions:

;
; PROBLEM A:
;
; Design a data definition to help a teacher organize their next field trip.
; On the trip, lunch must be provided for all students. For each student, track
; their name, their grade (from 1 to 12), and whether or not they have allergies.
;


(define-struct student (name grade allergies?))
;; interp. Student is (make-student String Natural Boolean)
(define S1 (make-student "Luke" 5 false))
(define S2 (make-student "Leia" 6 true))
(define S3 (make-student "Vader" 9 false))
(define S4 (make-student "Yoda" 11 true))

#;
(define (fn-for-student s)
  (... (student-name s)               ; String
       (student-grade s)              ; Natural
       (student-allergries?)))        ; Boolean

;; Template rules used:
;;  - Compound: 3 fields


;; =================
;; Functions:

;
; PROBLEM B:
;
; To plan for the field trip, if students are in grade 6 or below, the teacher
; is responsible for keeping track of their allergies. If a student has allergies,
; and is in a qualifying grade, their name should be added to a special list.
; Design a function to produce true if a student name should be added to this list.
;


;; Student -> Boolean
;; produce true if student is in grade 6 or bellow and has allergies
(check-expect (add-to-list? S1) false)
(check-expect (add-to-list? S2) true)
(check-expect (add-to-list? S3) false)
(check-expect (add-to-list? S4) false)

(define (add-to-list? s)
  (and (<= (student-grade s) 6) (equal? (student-allergies? s) true)))


;(define (add-to-list? s) false)    ;stub

#;
(define (add-to-list? s)
  (... (student-name s)
       (student-grade s)
       (student-allergries?)))

