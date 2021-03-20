#lang htdp/bsl
(require 2htdp/image)
(require 2htdp/universe)

;;
; EXERCISE 86
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._struct-edit3%29%29
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
;  (make-editor String String)
;
; INTERP: (make-editor s t) describes an editor whose visible text is
; (string-append s t) with the cursor displayed between s and t.
;
(define-struct editor [pre post])


;;
; Editor -> Editor
; Runs the editor from some initial state.
;
; USAGE:
;
;  (main (make-editor "" ""))
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


;;
; Editor KeyEvent -> Editor
; Adds ‘ke’ to the end of ‘pre’.
;
(check-expect
 (edit (make-editor "" "") "\b")
 (make-editor "" ""))

(check-expect
 (edit (make-editor "abd" "def") "\b")
 (make-editor "ab" "def"))

(check-expect
 (edit (make-editor "" "") "left")
 (make-editor "" ""))

(check-expect
 (edit (make-editor "abc" "def") "left")
 (make-editor "ab" "cdef"))

(check-expect
 (edit (make-editor "th" "e force") "left")
 (make-editor "t" "he force"))

(check-expect
 (edit (make-editor "" "") "right")
 (make-editor "" ""))

(check-expect
 (edit (make-editor "abc" "def") "right")
 (make-editor "abcd" "ef"))

(check-expect
 (edit (make-editor "" "") "z")
 (make-editor "z" ""))

(check-expect
 (edit (make-editor "hell" "") "o")
 (make-editor "hello" ""))

(check-expect
 (edit (make-editor "hello" "world") " ")
 (make-editor "hello " "world"))

(check-expect
 (edit (make-editor "a" "b") "\n")
 (make-editor "a" "b"))

(check-expect
 (edit (make-editor "y" "z") "\t")
 (make-editor "y" "z"))

(check-expect
 (edit (make-editor "y" "z") "escape")
 (make-editor "y" "z"))

(define (edit ed ke)
  (cond
    [(string=? ke "\b") (ed-remove-last ed)]
    [(string=? ke "left") (ed-left ed)]
    [(string=? ke "right") (ed-right ed)]
    [(and
      (= (string-length ke) 1)
      (not (string=? ke "\t"))
      (not (string=? ke "\n"))
      (not (text-too-large? ed)))
     (ed-insert ed ke)]
    [else ed]))


;;
; Editor -> Editor
; Remove last char of ed post text.
;
(check-expect
 (ed-remove-last (make-editor "" ""))
 (make-editor "" ""))

(check-expect
 (ed-remove-last (make-editor "abc" "def"))
 (make-editor "ab" "def"))

(define (ed-remove-last ed)
  (make-editor (string-remove-last (editor-pre ed))
               (editor-post ed)))

;;
; Editor -> Editor
; Moves last char of editor-pre to to the beginning of editor-pre.
;
(check-expect
 (ed-left (make-editor "" "abc"))
 (make-editor "" "abc"))

(check-expect
 (ed-left (make-editor "abc" "def"))
 (make-editor "ab" "cdef"))

(define (ed-left ed)
  (make-editor (string-remove-last (editor-pre ed))
               (string-append (string-last (editor-pre ed))
                              (editor-post ed))))
;;
; Editor -> Editor
; Moves first char of editor-post to to the end of editor-pre.
;
(check-expect
 (ed-right (make-editor "abc" ""))
 (ed-right (make-editor "abc" "")))

(check-expect
 (ed-right (make-editor "abc" "def"))
 (make-editor "abcd" "ef"))

(define (ed-right ed)
  (make-editor (string-append (editor-pre ed)
                              (string-first (editor-post ed)))
               (string-rest (editor-post ed))))

;;
; Editor Char -> Editor
; Inserts (appends) c at the end of editor-pre.
;
(check-expect
 (ed-insert (make-editor "" "") "a")
 (make-editor "a" ""))

(check-expect
 (ed-insert (make-editor "ab" "def") "c")
 (make-editor "abc" "def"))

(define (ed-insert ed c)
  (make-editor (string-append (editor-pre ed) c)
               (editor-post ed)))

;;
; String -> String
; Remove last char of ‘s’.
;
(check-expect (string-remove-last "") "")
(check-expect (string-remove-last "abc") "ab")

(define (string-remove-last s)
  (if (= (string-length s) 0)
      ""
      (substring s 0 (- (string-length s) 1))))

;;
; String -> 1String
; Produces the first char f ‘s’.
;
(check-expect (string-first "") "")
(check-expect (string-first "Linux") "L")

(define (string-first s)
  (if (= (string-length s) 0)
      ""
      (substring s 0 1)))

;;
; String -> 1String
; Produces the last char of ‘s’.
;
(check-expect (string-last "") "")
(check-expect (string-last "bar") "r")

(define (string-last s)
  (if (= (string-length s) 0)
      ""
      (substring s (- (string-length s) 1))))

;;
; String -> String
; Produces ‘s’ with the first char removed.
;
(check-expect (string-rest "") "")
(check-expect (string-rest "Linux") "inux")

(define (string-rest s)
  (if (= (string-length s) 0)
      ""
      (substring s 1)))

;;
; Editor -> Bool
; Checks whether rendered text fits into MTSCN
;
; NOTE: These tests pass with WHEN is (* 10 H). Otherwise, we would have
; to generate random text based on the W, but Let's keep it simple.
;
; NOTE: We
(check-expect
 (text-too-large? (make-editor "" ""))
 #f)

(check-expect
 (text-too-large?
  (make-editor "Hello world. " "May the force be with you!"))
 #f)

(check-expect
 (text-too-large?
  (make-editor
   "Hello world. Mussum ipsum cacildis."
   "May the force be with you. This text is too lengthy."))
 #t)

(define (text-too-large? ed)
  (> (image-width
      (beside
       (text (editor-pre ed) TH 'black)
       CURSOR
       (text (editor-post ed) TH 'black)))
     ;;
     ; Prevent last char from being placed in the middle of the end of
     ; the canvas in such a way that it is cut in half or placed
     ; almost entirely to the right of the canvas.
     (- W (/ H 2))))
