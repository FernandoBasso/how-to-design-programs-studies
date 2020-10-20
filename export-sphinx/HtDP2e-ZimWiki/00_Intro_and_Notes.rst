=======================
00 HTDP Intro and Notes
=======================
Created Saturday 26 September 2020


Racket
------


- `A Taste of Racket <https://jeremykun.com/2011/10/02/a-taste-of-racket/>`_
- `Docs Racket Lang HTDP <http://docs.racket-lang.org/htdp/>`_
- `The Little JavaScripter -- Douglas Crockford <http://www.crockford.com/javascript/little.html>`_
- `https://github.com/pkrumins/the-little-schemer <https://github.com/pkrumins/the-little-schemer>`_
- `Racket guide on how to run .rkt files <https://docs.racket-lang.org/guide/intro.html>`_.
- `Racket docs on Racket scripts <https://docs.racket-lang.org/guide/scripts.html>`_.
- `How to set language to htdp/bsl in REPL <https://stackoverflow.com/questions/46045086/how-to-set-language-to-htdp-bsl-in-repl>`_
- `How to use htpd/bsl from emacs or command line (my gist) <https://gist.github.com/FernandoBasso/c3f772fff707af3cd2c592e60af77529>`_
- `htdp/sbl support? <https://gitlab.com/jaor/geiser/-/issues/193>`_ (issue I openned for Geiser)
- `Emacs key bindings in DrRacket? <https://stackoverflow.com/questions/25711372/emacs-key-bindings-in-drracket>`_
- `the DrScheme repl isn’t the one in Emacs <https://blog.racket-lang.org/2009/03/the-drscheme-repl-isnt-the-one-in-emacs.html>`_


1. Add the repos to .emacs or init.el as described in
   `https://melpa.org/#/getting-started <https://melpa.org/#/getting-started>`_.
2. Run `M-x RET package-refresh-contents RET` (they don't mention it
   in the tutorial).
3. Run `M-x RET package-install geiser RET`.

Geiser info pages:

::

	C-h i m Geiser RET

Read about installation notes for `Chicken Scheme stuff <http://www.nongnu.org/geiser/geiser_2.html#Installation>`_.

::

	M-x run-geiser

Open a ``.rkt`` file in Emacs. Whether you have Geiser repl running or not, hit ``C-c C-a`` and all functions and other definitions inside the ``.rkt`` file will be available for use in the Geiser REPL.

In geiser REPL you can do

::

	(enter! "foo.rkt")
	(enter! "projs/main.rkt")


to load code on those files into the REPL. It seems the files must start with **``#lang racket``** or some thing like that.  Or, if you are editing a ``.rkt`` file and want to "enter" it into the REPL:

::

	C-c C-a

`http://www.nongnu.org/geiser/geiser_5.html <http://www.nongnu.org/geiser/geiser_5.html>`_


`https://docs.racket-lang.org/reference/interactive.html <https://docs.racket-lang.org/reference/interactive.html>`_


📖️ Teaching Languages — htdp/bsl
--------------------------------

::

	#lang htdp/bsl

`https://github.com/greghendershott/racket-mode/issues/125][Topic%20about%20images%20in%20htdp/bsl%20that%20shows%20some%20useful%20things. <https://github.com/greghendershott/racket-mode/issues/125][Topic%20about%20images%20in%20htdp/bsl%20that%20shows%20some%20useful%20things.>`_ May come in handy at some point.

To run tests like those with ``check-expect``, your ``.rkt`` file must start with one of these (beginner/intermediate/advanced student languages. The “+” a few more features.

::

	#lang htdp/bsl
	#lang htdp/bsl+
	#lang htdp/isl
	#lang htdp/isl+
	#lang htdp/asl

or

``#reader(lib "htdp-beginner-reader.ss" "lang")((modname area-tests) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))``

Emacs, Geiser
-------------
``C-u C-c C-z`` or ``C-c C-a`` brings one to the REPL in the current module/file. It DISPLAY IMAGES! 💖️

``C-c C-k`` runs fine with the http languages (``C-c C-a`` does not work for the teaching languages).

But not both.

Then, from ``racket-mode``, do ``C-c C-t`` (runs ``racket-test`` and be happy. From the command line,

::

	$ raco test file.rkt

Thanks to lexi-lambada@racket (irc). He refused to change his nick to lexi-λ as I suggested, though.

Racket Mode
-----------
`https://racket-mode.com/ <https://racket-mode.com/>`_

Docs for thing at point: ``C-c C-d``.
Insert lambda: ``C-m-y``.


Other libs used in the book
---------------------------

- `2htdp/image <https://docs.racket-lang.org/teachpack/2htdpimage.html>`_ → ``bitmap``
- `2htdp/universe <https://docs.racket-lang.org/teachpack/2htdpuniverse.html>`_ → ``animate``


DrRacket
--------

- `DrRacket Keyboard Shortcuts <https://docs.racket-lang.org/drracket/Keyboard_Shortcuts.html>`_ (Emacs!!! ⭐️)
``C-x o`` to move from interactions to definition window.

**TIP**: To use ``(bitmap "../images/foo.png")`` make sure the file is saved so the relative path works, otherwise, with an unsaved buffer, DrRacket will try to load images relative to your home directory.

**WARNING**: If you paste/insert images through Racket's UI, or your you set the language through the UI, you end up with unreadable source code files. Use a header like one of these and see the next tip about “Determine language from source”.

**TIP**: To allow the line ``#lang htdp/<some language>``, make sure “determine language from source” is selected in DrRacket's bottom left corner.

**TIP**: On wide screens, you may find it useful to display the interactions pane on the right side (instead of at the bottom). Go to “View → Use Horizontal Layout”. There is a setting in Preferences too.



Zim Notes
---------

Copy the list of headings from the top of each part/section, and then, in vim:

Double space each line:
::

	global :^.*$: s/\&/\r\r/

Make <digit><space><anything> heading a heading two level:
::

	s/^\d .\+$/===== & =====/

Make <digit>.<anything> a heading three level:
::

	%s/^\d\..* .\+$/==== & ====/g

Then in Zim, “Tools → Edit Source” and paste the contents.

How to name source files
------------------------

Files starting with “e” mean “Example”, and “ex” mean “EXercise”.

Name each source file incrementally and a descriptive name:

e001e-function.rkt (example from the book, note “e???e...”)
e002e-images.rkt
e003p-draw-tree.rkt (practice exercise, note “e003**p**”...).


Images
------

- `Drawing Animals Using Simple Shapes <https://www.pinterest.co.uk/sonjaeisenbeiss/drawing-animals-using-simple-shapes/>`_






