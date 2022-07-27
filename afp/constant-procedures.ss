(library (afp constant-procedures)
	 (export constant values? create black-hole)
	 (import (rnrs)
		 (only (afp primitives) delist))
	 
	 (define (constant . fixed-values)
	   (lambda ignored
	     (delist fixed-values)))

	 (define values? (constant #t))

	 (define (create . fixed-values)
	   (lambda ()
	     (delist fixed-values)))

	 (define black-hole (constant)))
