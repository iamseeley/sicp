; a function f is defined by the rule that f(n) = n if n < 3
; and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n >= 3.


; recursive process

(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1))
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))))))



; iterative process

(define (f-iter a b c count)
  (if (= count 0)
    a
    (f-iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))

(define (fi n)
  (f-iter 0 1 2 n))
