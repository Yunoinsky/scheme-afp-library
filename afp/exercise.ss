(define (toggle-list bool-list)
  (map not bool-list))

(define (unbundled-products list1 list2)
  (map * list1 list2))

(define (wrap-each . argv)
  (apply values (map list argv)))


(define (pipe-3 f1 f2 f3)
  (pipe (pipe f1 f2) f3))

(define (compose-3 fo fm fi)
  (compose fo (compose fm fi)))

(import (afp primitives))
(define (pipe-3-p f1 f2 f3)
  (lambda arguments
    (receive itm1 (apply f1 arguments)
      (receive itm2 (apply f2 itm1)
        (apply f3 itm2)))))
