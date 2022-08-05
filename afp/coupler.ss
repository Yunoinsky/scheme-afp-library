;; coupler 耦合器
;; 可以将两个或多个过程连接在一起形成一个新的过程

(library (afp coupler)
  (export compose pipe cross dispatch)
	(import (rename (rnrs) (expt rnrs-expt))
		      (afp primitives)
          (afp procedure-sections))
	(define (compose outer inner)
	  (lambda arguments
	    (receive intermediates (apply inner arguments)
		    (apply outer intermediates))))

  (define (pipe earlier later)
    (lambda arguments
      (receive intermediates (apply earlier arguments)
        (apply later intermediates))))
  (define (cross . procedures)
    (lambda arguments
      (delist (map invoke procedures arguments))))

  (define (dispatch . procedures)
    (lambda arguments
      (delist (map (sect apply <> arguments) procedures))))
  )

