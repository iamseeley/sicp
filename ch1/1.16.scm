; recursive version

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))


; iterative version

(define (iter-expt b n)
  (define (iter a b n)
    (cond ((= n 0) a )
          ((even? n) (iter a (* b b) (/ n 2)))
          (else (iter (* a b) (* b b) (/ (- n 1) 2)))))
  (iter 1 b n))
