(library (afp primitives)
	 (export delist receive rec expt square sect <...> <>)
	 (import (rename (rnrs) (expt rnrs-expt))
		 (only (chezscheme) syntax-error))


	 (define (delist ls)
	   (apply values ls))

	 (define (expt base exponent)
	   (unless (integer? exponent)
	     (error 'expt "non-integer exponent" exponent))
	   (rnrs-expt base exponent))

	 (define-syntax square
	   (syntax-rules ()
	     ((square quadrand)
	      (* quadrand quadrand))))

	 (define-syntax receive
	   (syntax-rules ()
	     ((receive formals expression body ...)
	      (call-with-values (lambda () expression)
				(lambda formals body ...)))))
	 (define-syntax rec
	   (syntax-rules ()
	     ((rec (name . variables) . body)
	      (letrec ((name (lambda variables . body))) name))
	     ((rec name expression)
	      (letrec ((name expression)) name))))
	
	 (define-syntax <>
	   (lambda (x)
	     (syntax-error x "invalid context")))
	 
	 (define-syntax <...>
	   (lambda (x)
	     (syntax-error x "invalid context")))

	 (define-syntax internal-sect
	   (syntax-rules (<> <...>)
	     [(internal-sect (slot-name ...) (position ...) <> . cs)
	      (internal-sect (slot-name ... x) (position ... x) . cs)]
	     [(internal-sect (slot-name ...) (proc arg ...))
	      (lambda (slot-name ...) ((begin proc) arg ...))]
	     [(internal-sect (slot-name ...) (proc arg ...) <...>)
	      (lambda (slot-name ... . rest-slot)
		(apply proc arg ... rest-slot))]
	     [(internal-sect (slot-name ...) (position ...) const . cs)
	      (internal-sect (slot-name ...) (position ... const) . cs)]))

	 (define-syntax sect
	   (syntax-rules ()
	     ((sect . consts-or-slots)
	      (internal-sect () () . consts-or-slots)))))


