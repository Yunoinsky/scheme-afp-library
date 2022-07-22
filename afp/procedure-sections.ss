(library (afp procedure-sections)
	 (export invoke curry equals-to?)
	 (import (rnrs))
	 (define (invoke proc . argv)
	   (apply proc argv))
	 
	 (define (curry proc)
	   (lambda (initial)
	     (lambda remaining
	       (apply proc initial remaining))))

	 (define equals-to?
	   (curry equal?)))
