;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname countdown2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; If hit <left>, increment countdown by 10.
;; If click mouse, go to 0 immediately.




(require 2htdp/image)
(require 2htdp/universe)

(define WIDTH 100)
(define HEIGHT WIDTH)
(define TEXT-SIZE 20)
(define TEXT-COLOUR "black")
(define CTR-Y (/ HEIGHT 2))
(define CTR-X (/ WIDTH 2))
(define MTS (empty-scene WIDTH HEIGHT))

;; Countdown is Natural
;; interp. number of the current countdown
(define CD1 10)    ; starting the countdown
(define CD2 4)
(define CD3 1)     ; almost done
(define CD4 0)     ; done, countdown stops

#;
(define (fn-for-countdown cd)
  (... t))

;; Countdown -> Countdown
;; advances the countdonw by subtracting 1, if countdown is zero it remains at zero
(check-expect (advance-countdown 10) 9)
(check-expect (advance-countdown 0) 0)

;(define (advance-countdown cd) 0)    ;stub

;; <used template from Countdown>
(define (advance-countdown cd)
  (if (= cd 0)
      0
      (- cd 1)))


;; Countdown -> Countdown
;; go back 10 steps (increase by 10) if left key is pressed
(check-expect (handle-key-left 7 "left") (+ 7 10))
(check-expect (handle-key-left 7 "
#;
(define (handle-key-left c ke)
  (cond [(key=? "left" ke) (+ c 10)]
        [else c]))

(define (handle-key-left c ke)    ;stub

;; Countdown -> Image
;; reder the countdown with the current world state
(define (render-countdown cd)
  (place-image (text (number->string cd) TEXT-SIZE TEXT-COLOUR)
               CTR-X
               CTR-Y
               MTS))

(define (main cd)
  (big-bang cd
            (on-tick advance-countdown)        ; Countdown -> Countdown
            (to-draw render-countdown)         ; Countdown -> Image
            (on-key handke-key)))              ; Countdown KeyEvent -> Countdown

