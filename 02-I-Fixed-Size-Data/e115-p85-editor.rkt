#lang htdp/bsl
(require 2htdp/image)
(require 2htdp/universe)

;;
; EXERCISE 85
; https://htdp.org/2020-8-1/Book/part_one.html#%28counter._%28exercise._struct-edit2%29%29
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
    [(string=? ke "\b")
     (make-editor (string-remove-last (editor-pre ed))
                  (editor-post ed))]
    [(string=? ke "left")
     (make-editor (string-remove-last (editor-pre ed))
                  (string-append (string-last (editor-pre ed))
                                 (editor-post ed)))]
    [(string=? ke "right")
     (make-editor (string-append (editor-pre ed)
                                 (string-first (editor-post ed)))
                  (string-rest (editor-post ed)))]
    [(and
      (= (string-length ke) 1)
      (not (string=? ke "\t"))
      (not (string=? ke "\n")))
     (make-editor (string-append (editor-pre ed) ke)
                  (editor-post ed))]
    [else ed]))

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

