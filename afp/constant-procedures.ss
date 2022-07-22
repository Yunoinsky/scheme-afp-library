(library (afp constant-procedures)
	 (export constant values? create black-hole)
	 (import (rename (rnrs) (expt rnrs-expt))
		 (afp primitives))
	 
	 (define (constant . fixed-values)
	   (lambda ignored
	     (delist fixed-values)))

	 (define values? (constant #t))

	 (define (create . fixed-values)
	   (lambda ()
	     (delist fixed-values)))

	 (define black-hole (constant)))
