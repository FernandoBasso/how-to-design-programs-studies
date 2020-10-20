# one
---
include: '"./part04a/image-list-area.rkt" src scheme'
infojs_opt: 'view:info toc:nil'
title: 'How to Code - Systematic Program Design'
---

Every week, propose an exercise that requires knowledge about the week’s
content. You don’t pass the solution, just the exercise.

Other Information
=================

Some things made with racket image functions:
<<https://github.com/rodrigosetti/stamps>>

<<https://www.edx.org/xseries/how-code-systematic-program-design>>

Based on this free online book:
<<http://www.ccs.neu.edu/home/matthias/HtDP2e/index.html>>

Read
[this](<https://courses.edx.org/courses/course-v1:UBCx+SPD1x+2T2016/courseware/d4b5b9454a3e47689c866b557162d73d/ce62429af48f406eaa792520ef45cd06/>)
very week, or every day.

Instructor: Gregor Kiczales TA (teacher assistant): Erika Thompson

MOOC: Massive Open Online Course

BSL: Beginning Student Language

[DONE]{.done .DONE} \[13/13\] 1a: Beginning Student Language {#a-beginning-student-language}
============================================================

These are **expressions**:

``` {.scheme}
(+ 3 4)
(+ (* 2 3) (/ 10 5))

;; Even simple numbers or strings are expressions
3.14
"May the force be with you."
```

`sqr`, `sqrt`, etc.

### Exercise 1:

``` {.example}
(sqrt (+ (sqr 3) (sqr 4))
```

i1.412135… is an irrational number. It can’t be written as a/b, where a
and b are integers; that means its decimal representation is infinitely
long (and not repeating like the decimal of 1/3). It would take all
memory to store it. It is pretty close to that, but not exactly,
perfectly that number.

Average of a set of numbers is the sum of the numbers divided by how
many numbers there are.

`(/ 10 3)` divides 10 by 3, and not 3 by then. Like wise: (- 10 3)
subctracts 3 from 10, not 10 from 3.

[DONE]{.done .DONE} Evaluation {#evaluation}

*****


``` {.example}
(+ 2 (* 3 4) ( - (+ 1 2) 3))
```

It starts with a primitive operation. It is called a **primitive call**
or **call to a primitive**.

Operator –&gt; operands. It may have nested primivive calls with
operators and operands. All operands must first be reduced to values,
then apply primitive to values.

Evaluations from left to right, from the inside to the outside.

[DONE]{.done .DONE} Strings and Images, pt 1 {#strings-and-images-pt-1}

*****


Strings and images are considered primitives.

``` {.scheme .rundoc-block rundoc-language="scheme" rundoc-tangle="yes" rundoc-results="output" rundoc-exports="both"}
"Racket!"
(string-append "Ada" " " "Lovelace")
(substring "how are you" 4 7)
```

Strings are zero-based indexed. Watch out for off-by-one errors.

``` {.scheme .rundoc-block rundoc-language="scheme" rundoc-tangle="yes" rundoc-results="output" rundoc-exports="both"}
(define str "What?")
(substring str (- (string-length str) 1))
```

[DONE]{.done .DONE} Strings and Images, pt 2 {#strings-and-images-pt-2}

*****


NOTE: The `require` line doesn’t produce a value. It is just a
declaration.

``` {.example}
(require 2htdp/image)
(circle 20 "solid" "magenta")
(rectangle 25 25 "outline" "pink")
(text "Hello!" 24 "orange")
```

``` {.example}
(above (circle 15 "solid" "yellow")
   (circle 20 "solid" "orange")
   (circle 25 "solid" "maroon"))
```

Tray with `beside`, `overlay`.

``` {.example}
(overlay (text "STOP!" 42 "white")
 (regular-polygon 60 8 "solid" "red"))
```

``` {.example}
(beside (square 20 "outline" "blue")
(above (circle 15 "solid" "red")
   (triangle 20 "solid" "green")))
```

[DONE]{.done .DONE} Constant Definitions, pt 1 {#constant-definitions-pt-1}

*****


Images are values and valures are expressions.

In DrRacket (perhaps emacs) you can do

``` {.example}
define CAT <paste an image here>
(rotate -10 CAT)
(rotate  10 CAT)
```

``` {.example}
(define RCAT (rotate -10 CAT))
(define LCAT (rotate  10 CAT))
LCAT
RCAT
```

``` {.example}
(define FOO (* 2 3))
(define BAR (* FOO 2))
(* FOO BAR)
```

[DONE]{.done .DONE} Constant Definitions, pt 2 {#constant-definitions-pt-2}

*****


A 20-second long video talking about the importance of defining things
with names.

[DONE]{.done .DONE} Function Definitions, pt. 1 {#function-definitions-pt.-1}

*****


A lot of this never changes… Only colors vary.

``` {.example}
(above (circle 40 "solid" "red")
   (circle 40 "solid" "yellow")
   (circle 40 "solid" "green"))
```

``` {.example}
;; Define a function that takes the color.
(define (bulb c)
  (circle 40 "solid" c))
```

:

``` {.example}
;; Invokes the function passing the color as parameter.
(bulb "purple")
```

:

``` {.example}
;; Invokes the function thrice a different color each time.
(above (bulb "red") (bulb "yellow") (bulb "green"))
```

A function that will give the length of the hypotenuse of any right
angle triangle.

``` {.example}
(define (pythag a b)
  (sqrt (+ (sqr a) (sqr b))))
```

:

``` {.example}
(pythag 3 4)
```

[DONE]{.done .DONE} Function Definitions, pt 2 {#function-definitions-pt-2}

*****


To define a function (look at how parensthesis are used, where they are
opened and closed):

``` {.example}
(define (<function name> <arg 1> ... <arg n>)
  (<expression>)
```

Expression form the body of the function.

To CALL/INVOKE/RUN/EXECUTE a function:

``` {.example}
(<name-of-a-defined-function> <expression>)
```

Example:

``` {.example}
;; Define
(define (bulb c)
  (circle 20 "solid" c))
```

:

``` {.example}
;; Call!
(bulb (string-append "mag" "enta"))
```

The expressions that are the parameters to the function are operands.

### [DONE]{.done .DONE} Function Evaluation Rules {#function-evaluation-rules}

For function definition:

-   Simply record the definition (put it in memory)

To evaluate a function call:

-   reduce operands/arguments to values
-   replace function call by
-   body of function in which every occurrence of parameters are
replaced by corresponding argument.

``` {.example}
(define (foo a b)
   (+ (* 3 a)b (* b a)))
```

Called as `(foo (+ 1 1) 4)`. Evaluation is:

Still the function call

``` {.example}
(foo 2 4)
```

Replace the call with the body of foo, with operands reduced to values.

``` {.example}
(+ (* 3 2) 4 (* 4 2))
```

Then

``` {.example}
(+ 6 4 (* 4 2))
```

Then

``` {.example}
(+ 6 4 8)
```

Finally

``` {.example}
18
```

[DONE]{.done .DONE} Booleans and if Expressions, pt 1 {#booleans-and-if-expressions-pt-1}

*****


Booleans are primitive as well.

``` {.example}
(define WIDTH 100)
(define HEIGHT 100)
```

:

``` {.example}
(> WIDTH HEIGHT)
(>= WIDTH HEIGHT)
```

### Predicates

Predicates are primitive functions that produce a boolean value. `>`,
`>=` and similar operators are known as **predicates**.

`string=?` is also a predicate.

``` {.example}
(string=? "foo" "Foo")
#false
```

``` {.example}
(define IMG1 (rectangle 10 20 "solid" "red"))
(define IMG2 (rectangle 20 18 "solid" "blud"))
(< (image-width IMG1) (image-width IMG2))
#true
```

[DONE]{.done .DONE} Booleans and if Expressions, pt 2 {#booleans-and-if-expressions-pt-2}

*****


Always three expressions.

``` {.example}
(if <expr>            ;; question (must produce a boolean)
<expr>            ;; true answer, the "then" clause
<expr>)           ;; false answer, the "else" clause
```

``` {.example}
(if (< (image-width IMG1) (image-height IMG1))
"Image is tall."
"Image is wide.")
```

[DONE]{.done .DONE} Booleans and if Expressions, pt 3 {#booleans-and-if-expressions-pt-3}

*****


Evaluation:

-   if the question expression is not a value, evaluate it and replace
with value.
-   if the question is true replace entire if expression with true/then
expression.
-   if the question is false replace entire if expression with
false/else expression.
-   if question produces a value other than a boolean so produce an
error.

[DONE]{.done .DONE} Booleans and if Expressions, pt 4 - AND {#booleans-and-if-expressions-pt-4---and}

*****


Check if an image is both wider and taller than some other image.

``` {.example}
(require 2htdp/image)
(define I1 (rectangle 10 20 "solid" "red"))
(define I2 (rectangle 20 10 "solid" "blue"))
(and (> (image-height I1) (image-height I2))
(< (image-width I1) (image-width I2)))
```

`and` only evaluates until it finds a false value. It shortcircuits.

There is also `or` and `not`.

[DONE]{.done .DONE} Discovering Primitives {#discovering-primitives}

*****


Guessing or right-click on something you want to learn more about and
then “Search in HelpDesk” (DrRacket).

[DONE]{.done .DONE} Exercises - Recommended Problems {#exercises---recommended-problems}

*****


### Simple Arithmetic Expressions

more-arithmetic-expression-starter.rkt

Write two expressions that multiply the numbers 3, 5 and 7. The first
should take advantage of the fact that \* can accept more than 2
arguments. The second should build up the result by first multiplying 3
times 5 and then multiply theresult of that by 7.

``` {.example}
(* 3 5 7)
(* (* 3 5) 7)
```

### Create Image

; Use the DrRacket square, beside and above functions to create an image
like this one: ; .


1. Solution


``` {.scheme}
(require 2htdp/image)
(overlay
 (above (beside
 (square 20 "solid" "blue")
 (square 20 "solid" "yellow"))
(beside (square 20 "solid" "yellow")
(square 20 "solid" "blue")))
 (square 60 "solid" "gray")
 (circle 50 "solid" "lightgray")
 (circle 52 "outline" "darkgray"))
```

### Compare Images

PROBLEM:

Based on the two constants provided, write three expressions to
determine whether:


1. IMAGE1 is taller than IMAGE2
2. IMAGE1 is narrower than IMAGE2
3. IMAGE1 has both the same width AND height as IMAGE2


``` {.example}
(define IMAGE1 (rectangle 10 15 "solid" "red"))
(define IMAGE2 (rectangle 15 10 "solid" "red"))
```

:

``` {.example}
(require 2htdp/image)
```

:

``` {.example}
(define IMAGE1 (rectangle 10 15 "solid" "red"))
(define IMAGE2 (rectangle 15 10 "solid" "red"))
```

:

``` {.example}
;; 1) IMAGE1 is taller than IMAGE2
(if (> (image-height IMAGE1) (image-height IMAGE2))
"Image 1 is taller."
"Image 2 is taller.")
```

:

``` {.example}
;; 2) IMAGE1 is narrower than IMAGE2
(if (< (image-width IMAGE1) (image-width IMAGE2))
"Image 1 is narrower."
"Image 2 is narrower.");
```

:

``` {.example}
;; 3) IMAGE1 has both the same width AND height as IMAGE2
(if (and (= (image-width IMAGE1) (image-height IMAGE2))
 (= (image-height IMAGE1) (image-height IMAGE2)))
"Same width and height."
"Different width and height.")
```

### Function Writing Starter

``` {.scheme}
(define (greater-number x y)
  (if (> x y)
  x
  y))

; (greater-number 5 6)
; 6
; (greater-number 13 11)
; 13
```

[TODO]{.todo .TODO} Propose Exercise {#propose-exercise}

*****


``` {.example}
(define NAME "Yoda")
```

Using a conditional, check whether the name is “Yoda” and t then return
“I bow before your might, Master Yoda”. Otherwise return “Who are you?”.

[TODO]{.todo .TODO} \[10/11\] 1b: How to Design Functions {#b-how-to-design-functions}
=========================================================

Now we actually start learning the design method.

HtDF: How to Desgin Functions

[DONE]{.done .DONE} Module Overview {#module-overview}

*****


[DONE]{.done .DONE} Full Speed HtDF Recipe {#full-speed-htdf-recipe}

*****


HtDF makes it easier to solve harder problems, but it is cumbersome to
solve simpler ones. Still, we use simpler problems to learn the
methodology so we can easily apply it to complex situations later.

[DONE]{.done .DONE} Slow Motion HtDF Recipe {#slow-motion-htdf-recipe}

*****


``` {.example}
; Design a function that consumes a number and produces twice that number.
; Call your function double. Follow the HtDF recipe and leave behind commented
; out versions of the stub and template.
```

:

``` {.example}
;; Number -> Number
;; Produces 2 times the given number
(check-expect (double 3) 6)
(check-expect (double 4.2) (* 2 4.2))
```

:

``` {.example}
;(define (double n) 0) ; This is th stub.
```

:

``` {.example}
;(define (double n) ;this is the template.
;  (... n))
```

:

``` {.example}
(define (double n)
  (* 2 n))
```

### [DONE]{.done .DONE} Peer Question {#peer-question}

``` {.example}
(define WIDTH 100)
(define HEIGHT 100)
```

:

``` {.example}
(define (half-tw x)
  (+ x (/ (- WIDTH x) 2)))
```

:

``` {.example}
;; Number -> Number
;; Given a y coordinate, produce y coord half way between it and HEIGHT
(check-expect (half-th 0) (/ HEIGHT 2))
(check-expect (half-th 20) (+ 20 (/ (- HEIGHT 20) 2)))
```

:

``` {.example}
(define (half-th y)
  (+ y (/ (- HEIGHT y) 2)))
```

[DONE]{.done .DONE} A Simple Practice Example (simple pluralizer) {#a-simple-practice-example-simple-pluralizer}

*****


``` {.example}
;; Design a function that pluralizes a given word. (Pluralize
;; means to convert the word to its plural form.) For
;; simplicity you may assume that just adding s is enough to
;; pluralize a word.
```

:

``` {.example}
;; String -> String
;; Given a string, add s to the end of it.
(check-expect (pluralize "car") "cars")
(check-expect (pluralize "girl") "girls")
(check-expect (pluralize "fuss") "fusss")
```

:

``` {.example}
;(define (pluralize word) "") ;stub
;
;(define (pluralize word) ;template
;  (... word))
```

:

``` {.example}
(define (pluralize word)
  (string-append word "s"))
```

### Example - yell!!

DESIGN a function called yell that consumes strings like “hello” and
adds “!” to produce strings like “hello!”.

Remember, when we say DESIGN, we mean follow the recipe.

``` {.example}
;; String -> String
;; Add “!” to the end of str.
(check-expect (yell "Hello") "Hello!")
(check-expect (yell "bye") "bye!")
(check-expect (yell "!") "!!")
```

:

``` {.example}
;(define (yell str) "")    ;stub
```

:

``` {.example}
;(define (yell str)        ;template
;  (... str))
```

:

``` {.example}
(define (yell str)
  (string-append str "!"))
```

### Repeat string

``` {.example}
;; String -> String
;; Duplicate a string (add a space and then a string itself). "" produces "".
(check-expect (repeat "foo") "foo foo")
(check-expect (repeat "") "")
```

:

``` {.example}
;(define (repeat str) "")   ;stub
```

:

``` {.example}
;(define (repeat str)       ;template
;  (... str))
```

:

``` {.example}
(define (repeat str)
  (if (string=? str "")
  ""
  (string-append str " " str)))
```

[DONE]{.done .DONE} When Tests are Incorrect {#when-tests-are-incorrect}

*****


<file:./part01b/area-tests.rkt>

When a test fails, it could be that:

-   the function definition is wrong
-   the test is wrong
-   both are wrong

Check the tests carefully before trying to fix function definitions. If
the test is wrong and you make the function conform to it, you’ll end up
with a function that produces wrong results.

[DONE]{.done .DONE} Varying Recipe Order {#varying-recipe-order}

*****


You can vary the order of the HtDF steps. It is not a strict waterfall
process (although you should try as much as possible stick with it).

Sometimes you start a signature as `Image -> Number`, and later you
realize it is best to have it `Image -> Natural`. We want signatures to
be as specific as possible.

<file:./part01b/image-area.rkt>

[DONE]{.done .DONE} Poorly Formed Problems {#poorly-formed-problems}

*****


**DESIGN** is the process of going from a poorly formed problem to a
well structured solution.

Functions that produce a boolean have a name that ends with a question
mark.

How many tests does a certain function needs to cover “all”
possibilities?

Code coverage should be 100%. Boundary conditions/corner cases.

<file:./part01b/image-tall.rkt>

[DONE]{.done .DONE} Practice Problems {#practice-problems}

*****


<file:./part01b/str-less-than-5.rkt>

<file:./part01b/boxify.rkt>

<file:./part01b/double-num.rkt>

[DONE]{.done .DONE} Quiz {#quiz}

*****


<file:./part01b/img-larger.rkt>

Needs 9 tests.

``` {.example}
   W I D T H
 H |                   | first img smaller | same size | first img larger |
 E |-------------------+-------------------+-----------+------------------|
 I | first img smaller | false             | false     | false            |
 G |                   | < <               | = <       | > <              |
 H |-------------------+-------------------+-----------+------------------|
 T | same size         | false             | false     | false            |
   |                   | < =               | = =       | > =              |
   |-------------------+-------------------+-----------+------------------|
   | first img larger  | false             | false     | true             |
   |                   | < >               | = >       | > >              |
```

[TODO]{.todo .TODO} Propose Exercise {#propose-exercise-1}

*****


Write a function that, given three numbers, check whether the sum of the
first two is greater than the third. Return a boolean.

[TODO]{.todo .TODO} \[15/15\] 2: How to Design Data {#how-to-design-data}
===================================================

[DONE]{.done .DONE} Module Overview {#module-overview-1}

*****


HtDD leverages HtDF.

[DONE]{.done .DONE} cond Expressions current section {#cond-expressions-current-section}

*****


<file:./part02/nested-ifs.rkt>

<file:./part02/cond.rkt>

``` {.example}
(cond [<question expr> <answer expr>]
  ...)
```

Questions must produce a boolean, except for that last which can be an
`else`.

### [DONE]{.done .DONE} Num &lt;, &gt; = zero {#num-zero}

<file:./part02/num-cond.rkt>

### [DONE]{.done .DONE} Cond evaluation {#cond-evaluation}

<file:./part02/cond-evaluation.rkt>

`cond` evaluates the first question. If it is `#false` then it discards
it and moves to the next question until one of them is `#true` or

[DONE]{.done .DONE} Data Definitions {#data-definitions}

*****


<file:./part02/traffic-simulation1.rkt>

program domain vs program

A light is red (program domain), but it is the value 0 in the program.
We represent real things with data. Red light is represented with zero,
for instance.

<file:./part02/traffic-dd.rkt>

Data definition describes:

-   how to for data of a new type;
-   how to represent information as data;
-   how to interpret data as information;
-   template for operating on data.

Data definition simplifies function:

-   restricts data consumed;
-   restricts data produced;
-   helps generate examples;
-   provides template.

[DONE]{.done .DONE} Atomic Non-Distinct {#atomic-non-distinct}

*****


HtDD: How to Design Data (recipe).

<file:./part02/city-name.rkt>

ATOMIC DATA can’t be taken apart into pieces that are meaningfully part
of the same domain. For instance, you can’t take the city name “Boston”
and break it in parts/letters and still each part be meaningful for the
city name.

### [DONE]{.done .DONE} Question 1 - Course Name {#question-1---course-name}

<file:./part02/course-name.rkt>

[DONE]{.done .DONE} HtDF With Non-Primitive Data {#htdf-with-non-primitive-data}

*****


<file:./part02/best-city.rkt>

### [DONE]{.done .DONE} Data Definition Exercise {#data-definition-exercise}

<file:./part02/icondd.rkt> (open it in DrRacket because it has images).

[DONE]{.done .DONE} HtDF X Structure of Data Orthogonality {#htdf-x-structure-of-data-orthogonality}

*****


Orthogonal means “mostly independent”. HtDF and HtDD recipies are
orthogonal, as we learn more forms of data, the recipies will continue
to work mostly unchanged.

Primitive: number, string;

Non-primitive (designed with HtDD): atomic, TLColor, CityName,
Enumeration, Interval, Itemization, Distinct (a special thing).

HtDW: How to Design Worlds

Then there are lists and trees.

[DONE]{.done .DONE} Interval {#interval}

*****


<file:./part02/seat-num.rkt>

``` {.example}
Foo is Natural[1, 32]
```

-   `[ ]` means “inclusive at the end of the interval”.
-   `( )` means “exclusive”
-   `[ )` and `( ]` are also possible.

\~\[1, 10\]\~ includes both 1 and 10. (10, 20\] does not include 10
(starts at 11) and include 20.

[DONE]{.done .DONE} Enumeration {#enumeration}

*****


Enumeration data definitions are used when the information to be
represented consists of two or more distinct values.

<file:./part02/letter-grade.rkt>

Distinct vs Non-Distinct

*****


Class grades like “A”, “B” and “C” are atomic dinstinct values. An
interval like `Natural[1, 32]` is

### Examples of atomic distinct values

-   colors
-   letter grades

### Examples of atomic non-distinct values

-   Numbers
-   Natural\[1, 10\]

[DONE]{.done .DONE} Itemization {#itemization}

*****


**Itemization** is used when the domain information is comprised of 2 or
more subclasses, **at least one of which is not a distinct data item**.

<file:./part02/countdown.rkt>

[DONE]{.done .DONE} HtDF with Interval {#htdf-with-interval}

*****


Designing a function that consumes an ‘Interval’ type.

<file:./part02/seat-num.rkt>

[DONE]{.done .DONE} HtDF with Enumeration {#htdf-with-enumeration}

*****


A function that consumes an ‘Enumeration’ type.

<file:./part02/bump-up.rkt>

Fault Injection: add error by purpose to test stuff.

<file:./part02/seasons1.rkt>

[DONE]{.done .DONE} HtDF with Itemization {#htdf-with-itemization}

*****


<file:./part02/countdown-image.rkt>

### [DONE]{.done .DONE} Exercises {#exercises}

<file:./part02/reservations.rkt>

[DONE]{.done .DONE} Structure of Information Flows Through {#structure-of-information-flows-through}

*****


Identifying the structure of the information is a key step in program
design.

### Question 1 (form of data appropriate for)

Form of data most appropriate for:

Information                                            Form of Data
  ----- ------------------------------------------------------ ---------------
  \#1   A person’s blood type                                  Enumeration
  \#2   The number of girls in a class of 50 students          Interval
  \#3   A TV that is either off, or set to a certain channel   Itemization
  \#4   The name of a highschool in Canada                     Simple Atomic
  \#5   The speed of a car with maximum speed of 200 km/hour   Interval
  \#6   The continents of the world                            Enumeration

### Question 2-3

``` {.example}
;; CarSpeed is Number[0, 200]
;; interp. the speed of a car in km/h: 0 means stopped, 200 is the maximum speed.
```

Q: How many data examples are necessary? A: 3. The boundarys and some in
the middle.

And the correct template is

``` {.example}
(define (fn-for-car-speed cs)
  (... cs))
```

<file:./part02/speed-limit.rkt>

[DONE]{.done .DONE} Practice Problems {#practice-problems-1}

*****


<file:./part02/demolish.rkt>

<[file:/part02/rocket.rkt](./file/part02rocket.rkt.markdown)>

[DONE]{.done .DONE} Design Quiz {#design-quiz}

*****


<file:./part02/quiz-age-health.rkt>

[TODO]{.todo .TODO} \[9/10\] 3a: How to Design Worlds {#a-how-to-design-worlds}
=====================================================

[DONE]{.done .DONE} Module Overview current section {#module-overview-current-section}

*****


Learn interactive graphical programs and write big-bang expressions.

[DONE]{.done .DONE} The big-bang Mechanism {#the-big-bang-mechanism}

*****


Determine the position of something in relation to the canvas. x and y
coordinates. In computers, x and y coordinates start from the top left
corner.

Big-bang is a function on htdp teaching pack that is basically a loop,
or gaming loop to help one write graphical stuff that moves on the
screen.

[DONE]{.done .DONE} Domain Analysis {#domain-analysis}

*****


Identify constant information and required `big-bang` options.

<file:./part03a/cat1.rkt> (DrRacket)

<file:./part03a/countdown1.rkt> (DrRacket)

[DONE]{.done .DONE} Program through main Function {#program-through-main-function}

*****


[DONE]{.done .DONE} Working through the Wish List {#working-through-the-wish-list}

*****


[DONE]{.done .DONE} Improving a World Program - Add SPEED {#improving-a-world-program---add-speed}

*****


DO NOT use magick nubers. Define constants for as much stuff as you
possibly can to make it easier to change the program later.

<file:./part03a/cat2-speed.krt> (DrRacket)

[DONE]{.done .DONE} Improving a World Program - Add key handler {#improving-a-world-program---add-key-handler}

*****


With large enumerations we use **white box testing**. Identify the
especial cases and have an `else` for everything else.

When making changes or adding features, always go back to the analisys
and identify things that change or are added there first, then got the
actuall source file. Always keep the analisys in sync with the source
file.

[DONE]{.done .DONE} Add mouse click {#add-mouse-click}

*****


Make cat be positioned at the place where the user clicks.

<[file:/part03a/cat4-mouse-handler.rkt](./file/part03acat4-mouse-handler.rkt.markdown)> (DrRacket)

[DONE]{.done .DONE} Practice Problems {#practice-problems-2}

*****


Design an animation of a countdown. Note that you have already worked
through a lot of this problem in the lecutre questions.

<file:./part03a/countdown-exercise.rkt> (DrRacket)

<file:./part03a/traffic-light-exercise.rkt> (DrRacket)

[TODO]{.todo .TODO} Propose Exercise {#propose-exercise-2}

*****


[TODO]{.todo .TODO} \[3/4\] 3b: Compound Data {#b-compound-data}
=============================================

[DONE]{.done .DONE} define-struct {#define-struct}

*****


``` {.scheme}
#lang htdp/bsl

(define-struct pos (x y))

(define P1 (make-pos 3 6))  ; constructor is make-pos
(define P2 (make-pos 2 8))

;; Using the selectors.
(pos-x P1) ; 3
(pos-y P2) ; 8

;; predicate
(pos? P1)      ; true
(pos? "hello") ; false
```

[DONE]{.done .DONE} Compound Data Definitions {#compound-data-definitions}

*****


<file:./part03b/hockey-players.rkt>

[DONE]{.done .DONE} Practice Problems - Compound Data {#practice-problems---compound-data}

*****


<file:./part03b/movie.rkt>

<file:./part03b/student.rkt>

WORKING HtDW With Compound Data

*****


<[file:/part03b/cowabunga.rkt](./file/part03bcowabunga.rkt.markdown)>

### TODO

<[file:/part03b/cowabunga-rotate.rkt](./file/part03bcowabunga-rotate.rkt.markdown)>

Practice Problems - HtDW with Compound Data

*****


[DONE]{.done .DONE} Final Project {#final-project}

*****


<file:./part03b/bounce3.rkt>

[TODO]{.todo .TODO} Propose Exercise {#propose-exercise-3}

*****


[DONE]{.done .DONE} 4a - Self-Reference {#a---self-reference}
=======================================

cons, first, rest empty, empty?

Well-formed self-reference:

-   at least one base case;
-   at least one self-reference case;

The self-reference template rule puts a natural recursion in the
template that corresponds to the self-reference in the type comment.

Test the base case first because it is simpler and because non-base case
stuff tend to rely on the base case.

<file:./part04a/quidditch1-emacs.rkt>

<file:./part04a/contains-negative.rkt>

<file:./part04a/olws1.rkt>

Position in List Templates

*****


![Position in List
Templates](./part04a/base-contrib-first-contrib-NR.jpg)

Consider a function called `product` that multiplies the numbers in a
list.

  …         base   contrib. of first   comb. first and NR
  --------- ------ ------------------- --------------------
  product   1      itself              product

<file:./part04a/product1.rkt>

Practice Problems {#practice-problems-3}

*****


<file:./part04a/double-all.rkt>

<file:./part04a/largest.rkt>

<file:./part04a/boolean-list.rkt>

<file:./part04a/image-list-area.rkt>

4b - Reference
==============

<file:./part04b/tuition-graph-v1.rkt> (DrRacket)

<file:./part04b/student-card-v1.rkt>

Practice Problems {#practice-problems-4}

*****


<file:./part04b/tuition-graph-v1.rkt> (DrRacket)

![](./imgs/part2/4a-selfref1.png)

