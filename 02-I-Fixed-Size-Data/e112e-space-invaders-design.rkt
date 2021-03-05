#lang htdp/bsl

;;
; SpaceGame is a structure:
;
;   (make-space-game Number Number)
;
; INTERP: (make-space-game (make-posn ux uy) tx)
; Describes a configuration where the UFO is at coordinates (ux, uy)
; and the Tank's x-coord is at tx.
;
(define-struct space-game [ufo tank])

(define invad (make-space-game (make-posn 50 60) 180))

(space-game? invad)
(posn-x (space-game-ufo invad))
(posn-y (space-game-ufo invad))
(space-game-tank invad)

