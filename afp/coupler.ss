(library (afp coupler)
	 (export compose)
	 (import (rename (rnrs) (expt rnrs-expt))
		 (afp primitives))
	 (define (compose outer inner)
	   (lambda arguments
	     (receive intermediates (apply inner arguments)
		      (apply outer intermediates)))))
	 
