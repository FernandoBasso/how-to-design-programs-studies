#lang htdp/bsl
(require 2htdp/image)
(require 2htdp/universe)

;
; EXERCISE 62:
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._cond12%29%29
;

(define LOCKED "locked")
(define CLOSED "closed")
(define OPEN "open")

;;
; Autoclose the door after three seconds.
;
(define TIME-TO-AUTOCLOSE 3)

;;
; A DoorState is one of:
; • LOCKED
; • CLOSED
; • OPEN
;

;;
; DoorState -> DoorState
; Simulates a door with an automatic door closer.
;
; USAGE:
;
;   (main LOCKED)
;
(define (main initial-state)
  (big-bang initial-state
            [to-draw door-render]
            [on-key door-action]
            [on-tick door-closer TIME-TO-AUTOCLOSE]))

;;
; DoorState -> DoorState
; Closes an open door over a period of one tick.
;
(check-expect (door-closer LOCKED) LOCKED)
(check-expect (door-closer CLOSED) CLOSED)
(check-expect (door-closer OPEN) CLOSED)

(define (door-closer ds)
  (cond
    [(string=? ds LOCKED) LOCKED]
    [(string=? ds CLOSED) CLOSED]
    [(string=? ds OPEN) CLOSED]))

;;
; DoorState KeyEvent -> DoorState
; Turns a key event ke into an action on the state ds.
; Locks, unlocks or pushes the door open.
;
; We don't need more examples/tests because each case cond expression
; handles a particular combination of the current state combined with
; the key that changes the state. Pressing any key that does not match
; the state they operate simply returns the current door state.
;
(check-expect (door-action LOCKED "u") CLOSED)
(check-expect (door-action CLOSED "l") LOCKED)
(check-expect (door-action CLOSED " ") OPEN)
(check-expect (door-action LOCKED "z") LOCKED)
(check-expect (door-action CLOSED "z") CLOSED)
(check-expect (door-action OPEN "z") OPEN)

(define (door-action ds ke)
  (cond
    [(and (string=? ds LOCKED) (string=? ke "u")) CLOSED]
    [(and (string=? ds CLOSED) (string=? ke "l")) LOCKED]
    [(and (string=? ds CLOSED) (string=? ke " ")) OPEN]
    [else ds]))

;;
; DoorState -> Image
; Renders the state ds into a large text image.
;
(check-expect
 (door-render CLOSED)
 (text CLOSED 40 'red))

(define (door-render ds)
  (text ds 40 'red))

