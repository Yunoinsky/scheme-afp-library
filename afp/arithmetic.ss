(library (afp arithmetic)
	 (export arithmetic-mean lesser factorial terminal double greater geo? halve 
		 greatest-odd-divisor reverse-digits
		 power-of-two add1 sub1)
	 (import (rename (rnrs) (expt rnrs-expt)) 
		 (afp primitives))

	 (define (arithmetic-mean a b)
	   (/ (+ a b) 2))

	 (define (lesser left right)
	   (if (< left right) left right))

	 (define (greater left right)
	   (if (> left right) left right))

	 (define (factorial number)
	   (if (zero? number)
	     1
	     (* number (factorial (- number 1)))))

	 (define (terminal number)
	   (if (zero? number)
	     0
	     (+ number (terminal (- number 1)))))

	 (define (geo? a b c)
	   (= (* a c) (* b b)))

	 (define (double number)
	   (* number 2))
	 (define add1 (sect + <> 1))
	 (define sub1 (sect - <> 1))
	 (define power-of-two (sect expt 2 <>))
	 
	 (define (halve number)
	   (receive (quotient remainder) (div-and-mod number 2)
		    quotient))

	 (define (greatest-odd-divisor number)
	   (if (odd? number)
	     number
	     (greatest-odd-divisor (/ number 2))))

	 (define (reverse-digits number)
	   (receive (quotient remainder) (div-and-mod number 10)
		    (+ (* remainder 10) quotient)))
	 )
	 

