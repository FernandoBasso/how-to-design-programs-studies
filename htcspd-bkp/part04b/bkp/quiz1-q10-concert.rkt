;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname quiz1-q10-concert) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct concert (artist venue))
;; Concert is (make-concert String String)
;; interp. a concert with the band playing, and the venue they're playing at
(define C1 (make-concert "Shakey Graves" "Commodore Ballroom"))
(define C2 (make-concert "Tallest Man On Earth" "Orpheum Theatre")) 
#;
(define (fn-for-concert c)
  (... (concert-artist c)
       (fn-for-venue (concert-venue c))))

;; !!!WRONG!!! Why fn-for-venue? No need for the helper function because venue is a
;; String (a primitive) value.

    
;; ListOfConcert is one of:
;; - empty
;; - (cons Concert ListOfConcert)
;; interp. a list of concerts
(define LOC1 empty)
(define LOC2 (cons C1 (cons C2 empty)))
#;
(define (fn-for-loc loc)
  (cond [(empty? loc) (...)] 
        [else
         (... (fn-for-concert (first loc))
              (fn-for-loc (rest loc)))]))

;; Template Rules Used:
;; - one of: 2 cases
;;   - atomic distinct: empty
;;   - compound: (cons Concert ListOfConcert)
;; - reference: (first loc) is Concert
;; - self-reference (rest loc) is ListOfConcert


     
(define-struct festival (name shows))
;; Festival is (make-festival String ListOfConcert)
;; interp. a festival with name, and list of shows that are part of the festival
(define CANCELLED-FESTIVAL (make-festival "" empty))
(define VFMF (make-festival "Vancouver Folk Music Festival" 
                            (cons (make-concert "Hawksley Workman" "Main Stage")
                                  (cons (make-concert "Grace Petrie" "Stage 1")
                                        (cons (make-concert "Mary Gauthier" "Stage 5") empty)))))
#;
;(define (fn-for-festival f)
;  (... (festival-name f))
;  (cond [(empty? (festival-shows f)) (...)]
;        [else
;         (... (fn-for-concert (first (festival-shows f)))
;              (fn-for-festival (rest (festival-shows f))))]))

;; !!!WRONG!!! Should be:
#;
(define (fn-for-festival f)
  (... (festival-name f)
       (fn-for-loc (festival-shows f))))





;; ==========
;; FUNCTIONS:

;; Festival -> ListOfString
;; Produces a list of each band paired with where they are performing.
(check-expect (festival-schedule (make-festival "" empty)) empty)
(check-expect (festival-schedule
               (make-festival
                "CFMF"
                (cons (make-concert "Father John Misty" "Main Stage") empty)))
              (cons "Father John Misty: Main Stage" empty))

;; We need a check-expect that is at least two elements long.

(define (festival-schedule f) f) ;stub

(define (festival-schedule f)
  (schedule-loc (festival-shows f)))

;; Concert -> String
;; Produce the name and venue of a concert, separated with a colon, as a string.
;; "<name: venue>"
(define (display-concert c) "") ;stub






;; UPDATE FESTIVAL DEFINITION:

(define-struct festival (name headliner shows))
;; Festival is (make-festival String ListOfConcert)
;; interp. a festival with name, and list of shows that are part of the festival

; UPDATE THESE AS WELL.
;(define CANCELLED-FESTIVAL (make-festival "" empty))
;(define VFMF (make-festival "Vancouver Folk Music Festival" 
;                            (cons (make-concert "Hawksley Workman" "Main Stage")
;                                  (cons (make-concert "Grace Petrie" "Stage 1")
;                                        (cons (make-concert "Mary Gauthier" "Stage 5") empty)))))

#;
(define (fn-for-festival f)
  (... (festival-name f)
       (festival-headliner f)
       (fn-for-loc (festival-shows f))))


;; They say it should be:
(define (fn-for-festival f)
  (... (festival-name f)
       (fn-for-concert (festival-headliner f))
       (fn-for-loc (festival-shows f))))



