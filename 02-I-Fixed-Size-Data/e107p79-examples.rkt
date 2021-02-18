#lang htdp/bsl

;;
; EXERCISE 79
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._data-uni._%28exercise._struct10%29%29
;;

;;
; A Color is one of:
; • "white"
; • "yellow"
; • "orange"
; • "green"
; • "red"
; • "blue"
; • "black"
(define BG-COLOR "white")
(define FG-COLOR "orange")


;;
; H is a Number between 0 and 100.
; INTERP: represents a happiness value.
;
(define PURE-JOY 100)
(define FEELING-OK 60)
(define DEJECTEDLY-SAD 0)


;;
; A Person is a structure:
;   (make-person String String Boolean)
;
(define-struct person [fstname lstname male?])

(define lara (make-person "Lara" "Croft" #f))

;
; It doesn't look like a bad idea to use a field that looks like a
; predicate because it can be used like a predicate. We could it like
; this:
;
(cond
  [(false? (person-male? lara)) 'Male]
  [else 'Female])
;
; I'm just not sure this is idiomatic Racket/Scheme/Lisp, or whether
; there are other things I am not aware of as yet.
;;


;;
; A Dog is a structure:
;   (make-dog Person String PositiveInteger H)
;
; INTERP: A dog has an owner of the type Person, a name, an age which
; is a positive integer, and a “Happines” scale value.
;
(define-struct dog [owner name age happiness])

(define vakinha
  (make-dog (make-person "Lara" "Croft" #f)
            "Vakinha"
            6
            100))

;;
; A Weapon is one of:
; • #f
; • Posn
; INTERP: means the missile hasn't been fired yet; a Posn means it is
; in flight
;;
(define missile1 #f)
(define missile2 (make-posn 3 4))

