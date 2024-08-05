(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; if b is greater than 0, add a and b. Otherwise, subtract a and b.

;; the operator is the result of a conditional expression. 

;; procedures in Scheme can be treated like any other values.
