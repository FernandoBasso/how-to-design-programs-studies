# 01 Prologue How To Program
Created Friday 25 September 2020


* [HTDP Part 1, Prologue: How To Program](https://htdp.org/2020-8-1/Book/part_prologue.html#(part._arithmetic-pro))
* [Beginning Student Language (http/bsl)](https://docs.racket-lang.org/htdp-langs/beginner.html#%28def._htdp-beginner._%28%28lib._lang%2Fhtdp-beginner..rkt%29._string-~3enumber%29%29)



Arithmetic and Arithmetic
-------------------------
In the book: [Arithmetic and Arithmetic](https://htdp.org/2020-8-1/Book/part_prologue.html#%28part._arithmetic-pro%29)

Strings are lists of chars in double quotes.

``+`` and ``string-append`` are operations. Both can handle as many operands as desired.

*Primitives*, also called *pre-defined* or built-in.

	(+ (string-length "FP") 1)
	;; → 3


	#lang htdp/bsl
	(require 2htdp/image)
	
	(define ROCKET (bitmap "../images/rocket.png"))
	
	ROCKET

The ORIGIN is at position (0, 0) on the scene:

	(place-image (circle 5 "solid" "green")
	             50 80
	             (empty-scene 100 100))


![](./01_Prologue_How_To_Program/empty-scene.png)

Input and Output
----------------
In the book: [Input and Output](https://htdp.org/2020-8-1/Book/part_prologue.html#%28part._some-i%2Fo%29)

	y = the image that contains a dot x² pixels below the top.

Functions: input → Output

Define function with formal parameters and apply the function supplying arguments.

Many Ways to Compute
--------------------
In The Book: [Many Ways to Compute](https://htdp.org/2020-8-1/Book/part_prologue.html#%28part._pro-cond%29)

![](./01_Prologue_How_To_Program/math-function-sign.png)



One Program, Many Definitions
-----------------------------
In The Book: [One Program, Many Definitions](https://htdp.org/2020-8-1/Book/part_prologue.html#%28part._pro-many-def%29)

Use of constants to avoid magic numbers.

Constants MUST be defined in the order as they are used. If a second constant depends on the value of some other constant, that other constant must be defined first.

One More Definition
-------------------
In The Book: [One More Definition](https://htdp.org/2020-8-1/Book/part_prologue.html#%28part._more-def%29)

You Are a Programmer Now
------------------------
In The Book: [You Are a Programmer Now](https://htdp.org/2020-8-1/Book/part_prologue.html#%28part._program-now%29)

Not!
----
In The Book: [Not!](https://htdp.org/2020-8-1/Book/part_prologue.html#%28part._sec~3anot%29)







The End
-------

















