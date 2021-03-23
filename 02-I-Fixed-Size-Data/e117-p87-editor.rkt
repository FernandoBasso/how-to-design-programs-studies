#lang htdp/bsl
(require 2htdp/image)
(require 2htdp/universe)

;;
; EXERCISE 87
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._struct-edit4%29%29
;
; One field in the structure may contain the entire text entered, and
; the other the number of characters between the first character
; (counting from the left) and the cursor.
;;

;;
; Canvas height.
;
(define H 60)

;;
; Canvas with is ten times the height.
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
;  (make-editor String Int)
;
; INTERP: (make-editor t n) describes an editor whose visible text is
; txt with the cursor displayed between at position pos.
;
(define-struct editor [txt pos])

;;
; Editor -> Editor
; Runs the editor from some initial state.
;
; USAGE:
;
;  (main (make-editor "" 0))
;
(define (main ed)
  (big-bang ed
            [to-draw render]
            [on-key edit]))

;;
; Editor -> Image
; Renders a line of text with the cursor.
;
(check-expect
 (render (make-editor "" 0))
 (overlay/align 'left 'center
                (beside
                 (text "" TH 'black)
                 CURSOR
                 (text "" TH 'black))
                MTSCN))

(check-expect (render
               (make-editor "helloworld" 5))
              (overlay/align 'left 'center
                             (beside
                              (text "hello" TH 'black)
                              CURSOR
                              (text "world" TH 'black))
                             MTSCN))

(check-expect (render
               (make-editor "hello world" 6))
              (overlay/align 'left 'center
                             (beside
                              (text "hello " TH 'black)
                              CURSOR
                              (text "world" TH 'black))
                             MTSCN))

(check-expect (render
               (make-editor "hello world" 11))
              (overlay/align 'left 'center
                             (beside
                              (text "hello world" TH 'black)
                              CURSOR
                              (text "" TH 'black))
                             MTSCN))

(define (render ed)
  (overlay/align
   'left
   'center
   (beside
    (text (txt-bef ed) TH 'black)
    CURSOR
    (text (txt-aft ed) TH 'black))
   MTSCN))

;;
; Editor KeyEvent -> Editor
; Edit text txt based on ke.
;
; The ending ‘else’ clause handles the case where a combination
; ‘Shift+<char>’ is pressed to produce uppercase characters. It
; prevents the error:
;
;   cond: all question results were false
;
(check-expect (edit (make-editor "" 0) "\b") (make-editor "" 0))
(check-expect (edit (make-editor "a" 1) "\b") (make-editor "" 0))
(check-expect (edit (make-editor "hellox world" 6) "\b")
              (make-editor "hello world" 5))

(check-expect (edit (make-editor "" 0) "left") (make-editor "" 0))
(check-expect (edit (make-editor "abc" 3) "left")
              (make-editor "abc" 2))
(check-expect (edit (make-editor "hello world" 6) "left")
              (make-editor "hello world" 5))

(check-expect (edit (make-editor "" 0) "h") (make-editor "h" 1))
(check-expect (edit (make-editor "hell" 4) "o")
              (make-editor "hello" 5))
(check-expect (edit (make-editor "hell world" 4) "o")
              (make-editor "hello world" 5))

(define (edit ed ke)
  (cond
    [(or (string=? ke "\n") (string=? ke "\t") (text-too-large? ed)) ed]
    [(string=? ke "\b") (handle-backspace ed)]
    [(string=? ke "left") (handle-left ed)]
    [(string=? ke "right") (handle-right ed)]
    [(= (string-length ke) 1) (handle-insert ed ke)]
    [else ed]))

;;
; Editor -> Editor
; Move cursor one position to the right.
;
(check-expect (handle-right (make-editor "" 0)) (make-editor "" 0))
(check-expect (handle-right (make-editor "abc" 3)) (make-editor "abc" 3))
(check-expect (handle-right (make-editor "abc" 1)) (make-editor "abc" 2))

(define (handle-right ed)
  (if (= (string-length (editor-txt ed)) (editor-pos ed))
      ed
      (make-editor (editor-txt ed) (add1 (editor-pos ed)))))

;;
; Editor -> Editor
; Move cursor one position to the left.
;
(check-expect (handle-left (make-editor "" 0)) (make-editor "" 0))
(check-expect (handle-left (make-editor "hello" 3))
              (make-editor "hello" 2))
(check-expect (handle-left (make-editor "world" 5))
              (make-editor "world" 4))

(define (handle-left ed)
  (if (= (string-length (editor-txt ed)) 0)
      ed
      (make-editor (editor-txt ed) (sub1 (editor-pos ed)))))

;;
; Editor KeyEvent -> Editor
; Inserts ‘c’ to the left of ‘pos’.
;
(check-expect (handle-insert (make-editor "" 0) "h")
              (make-editor "h" 1))
(check-expect (handle-insert (make-editor "Linu" 4) "x")
              (make-editor "Linux" 5))
(check-expect (handle-insert (make-editor "hell world" 4) "o")
              (make-editor "hello world" 5))

(define (handle-insert ed c)
  (if (= (string-length (editor-txt ed)) (editor-pos ed))
      (make-editor (string-append (editor-txt ed) c)
                   (add1 (editor-pos ed)))
      (make-editor
       (string-append (substring (editor-txt ed)
                                 0
                                 (editor-pos ed))
                      c
                      (substring (editor-txt ed)
                                 (editor-pos ed)))
       (add1 (editor-pos ed)))))

;;
; Editor -> String
; Gets text to the left of the cursor position.
;
(check-expect (txt-bef (make-editor  "" 0)) "")
(check-expect (txt-bef (make-editor "abcd" 2)) "ab")
(check-expect (txt-bef (make-editor "abcd" 4)) "abcd")
(check-expect (txt-bef (make-editor "abcd" 0)) "")

(define (txt-bef ed)
  (substring (editor-txt ed) 0 (editor-pos ed)))

;;
; Editor -> String
; Gets text to the right of the cursor position.
;
(check-expect (txt-aft (make-editor  "" 0)) "")
(check-expect (txt-aft (make-editor "abcd" 2)) "cd")
(check-expect (txt-aft (make-editor "abcd" 0)) "abcd")
(check-expect (txt-aft (make-editor "abcd" 4)) "")

(define (txt-aft ed)
  (substring (editor-txt ed) (editor-pos ed)))

;;
; Editor -> Editor
; Removes one char to the left, if any.
;
(check-expect (handle-backspace (make-editor "" 0)) (make-editor "" 0))
(check-expect (handle-backspace (make-editor "a" 1)) (make-editor "" 0))
(check-expect (handle-backspace (make-editor "xyz" 3)) (make-editor "xy" 2))
(check-expect
 (handle-backspace (make-editor "helloZ world" 6))
 (make-editor "hello world" 5))

(define (handle-backspace ed)
  (cond
    ;;;;
    ;; Nothing to delete to the left.
    [(= (editor-pos ed) 0) ed]
    ;;;;
    ;; ‘pos’ is at the very end of the text. Just delete the char and
    ;; decrement ‘pos’.
    [(= (editor-pos ed) (string-length (editor-txt ed)))
     (make-editor (substring (editor-txt ed)
                             0
                             (sub1 (string-length (editor-txt ed))))
                  (sub1 (editor-pos ed)))]
    ;;;;
    ;; Cursor somewhere between first and last chars. We have to
    ;; remove the char immediately to left of the cursor.
    [else
     (make-editor (string-append
                   (substring (editor-txt ed) 0
                              (sub1 (editor-pos ed)))
                   (substring (editor-txt ed)
                              (editor-pos ed)))
                  (sub1 (editor-pos ed)))]))

;;
; Editor -> Bool
; Checks whether rendered text fits into MTSCN
;
; NOTE: These tests pass with WHEN is (* 10 H). Otherwise, we would have
; to generate random text based on the W, but Let's keep it simple.
;
; NOTE: We
(check-expect
 (text-too-large? (make-editor "" 0))
 #f)

(check-expect
 (text-too-large?
  (make-editor "Hello world. May the force be with you!" 0))
 #f)

(check-expect
 (text-too-large?
  (make-editor
   "Hello world. Mussum ipsum cacildis. May the force be with
you. This text is too lengthy."
   0))
 #t)

(define (text-too-large? ed)
  (> (image-width
      (beside
       (text (txt-bef ed) TH 'black)
       CURSOR
       (text (txt-aft ed) TH 'black)))
     ;;
     ; Prevent last char from being placed falling out of the right
     ; edge of the canvas.
     (- W (/ H 2))))

