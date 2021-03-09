#lang htdp/bsl
(require 2htdp/image)

;;
; EXERCISE 83
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._struct-edit0%29%29
;;

;;
; Canvas height (H).
;
(define H 60)

;;
; Canvas WITH is ten times the height.
;
(define W (* 10 H))

;;
; Text height is ¹¹/₂₀ of the height of the canvas. We ‘floor’ it
; because ‘text’ only takes integers.
;
(define TH (floor (* (/ 11 20) H)))

(define MTSCN (empty-scene W H))

(define CURSOR (rectangle 1 H 'solid 'red))

;;
; An Editor is a structure:
;
;  (make-editor String String)
;
; INTERP: (make-editor s t) describes an editor whose visible text is
; (string-append s t) with the cursor displayed between s and t.
;
(define-struct editor [pre post])

;;
; Editor -> Image
; Renders a line of text with the cursor.
;
(check-expect
 (render (make-editor "" ""))
 (overlay/align 'left 'center
                (beside
                 (text "" TH 'black)
                 CURSOR
                 (text "" TH 'black))
                MTSCN))

(check-expect (render
               (make-editor "hello" "world"))
              (overlay/align 'left 'center
                             (beside
                              (text "hello" TH 'black)
                              CURSOR
                              (text "world" TH 'black))
                             MTSCN))
(check-expect (render
               (make-editor "hello world" ""))
              (overlay/align 'left 'center
                             (beside
                              (text "hello world" TH 'black)
                              CURSOR
                              (text "" TH 'black))
                             MTSCN))

(define (render e)
  (overlay/align
   'left
   'center
   (beside
    (text (editor-pre e) TH 'black)
    CURSOR
    (text (editor-post e) TH 'black))
   MTSCN))

