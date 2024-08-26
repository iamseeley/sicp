(define (double x) (+ x x))
(define (half x) (/ x 2))


(define (faster-multi a b)
  (cond ((= b 0) 0)
        ((= b 1) a)
        (( even? b) (double (faster-multi a (half b))))
        (else (+ a (faster-multi a (- b 1))))))




