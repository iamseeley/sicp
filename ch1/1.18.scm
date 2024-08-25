(define (double x) (+ x x))
(define (half x) (/ x 2))


(define (iter-multi a b)
  (define (iter n a b)
    (cond ((= b 0) n)
          ((even? b) (iter n (double a) (half b)))
          (else (iter (+ n a) a (- b 1)))))
  (iter 0 a b))
