(define (toggle-list bool-list)
  (map not bool-list))

(define (unbundled-products list1 list2)
  (map * list1 list2))

(define (wrap-each . argv)
  (apply values (map list argv)))

