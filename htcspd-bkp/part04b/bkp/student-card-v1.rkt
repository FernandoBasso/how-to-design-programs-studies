#lang htdp/bsl

(define-struct student (name id))
;; Student is (make-student String Natural)
;; Interp. A student with a name and ID.
(define S1 (make-student "Eva" 1))
(define S2 (make-student "Ada" 2))

#;
(define (fn-for-student s)
  (... (student-name s)
       (student-id s)))

;; Template Rules Used:
;; - compound: (make-student Student Natural)


;; ListOfStudents is:
;; - empty
;; - (cons Student ListOfStudent)
;; Interp. a list of students
(define LOS1 empty)
(define LOS2 (cons S1 empty))
(define LOS3 (cons S1 (cons S2 empty)))

#;
(define (fn-for-los los)
  (cond [(empty? los) (...)]
        [else
         (... (fn-for-student (first los))
              (fn-for-los (rest los)))]))

;; Template Rules Used:
;; - one of: 2 cases:
;; - atomic distinct: empty
;; - compound: (cons ListOfStudent ListOfString)
;; - reference: (first los) is Student
;; - self-reference: (rest los) is ListOfStudent


;; ========
;; PROBLEM:
;; --------
;; Design a function that consumes a list of students and produces a
;; list of student cards, where each student card contains the name
;; and ID of the student. Assume a student card is simply a string of
;; the form:
;;
;;     "<student name> <student id>"
;;
;; For example:
;;
;; (student-cards (cons
;;                (make-student "John" 7893
;;                               (cons (make-student "Eva" 3124) empty)))
;; should produce
;;
;; (cons "John 7893" (cons "Eva 3124" empty))
;;

;; ListOfStudent -> ListOfString
;; Produces a list of student cards, each of the form "<name> <id>".
(check-expect (student-cards empty) empty)
(check-expect (student-cards (cons (make-student "Ada" 2) empty))
              (cons "Ada 2" empty))
;; We need to test a list that is at least two elements long because it
;; will show us any errors in the NATURAL RECURSION.
(check-expect (student-cards (cons (make-student "Eva" 1)
                                   (cons
                                    (make-student "Ada" 2) empty)))
              (cons "Eva 1" (cons "Ada 2" empty)))


; (define (student-cards los) empty)    ;stub

(define (student-cards los)
  (cond [(empty? los) empty]
        [else
         (cons (make-card (first los))
                (student-cards (rest los)))]))


;; Student -> String
;; Produce student card as a string by using student name and id.
(define (make-card s)
  (string-append (student-name s)
                 " "
                 (number->string (student-id s))))



