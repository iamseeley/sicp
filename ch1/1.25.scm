(define (square x) (* x x)) 
    
(define (prime? n) 
 (fast-prime? n 100))


(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))


(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time))))


(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))


; fast-prime? with fast-expt

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt base n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt base (/ n 2))))
        (else (* base (fast-expt base (- n 1))))))

(define (expmod base exp m)
 (remainder (fast-expt base exp) m))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

 (timed-prime-test 1009) 
 (timed-prime-test 1013) 
 (timed-prime-test 1019) 
 (timed-prime-test 10007) 
 (timed-prime-test 10009) 
 (timed-prime-test 10037) ; hangs after computing this 
 (timed-prime-test 100003) 
 (timed-prime-test 100019) 
 (timed-prime-test 100043) 
 (timed-prime-test 1000003) 
 (timed-prime-test 1000033) 
 (timed-prime-test 1000037) 


(newline)
(timed-prime-test 1000000007)
(timed-prime-test 1000000009)
(timed-prime-test 1000000021)
(timed-prime-test 10000000019)
(timed-prime-test 10000000033)
(timed-prime-test 10000000061)
(timed-prime-test 100000000003)
(timed-prime-test 100000000019)
(timed-prime-test 100000000057)
(timed-prime-test 1000000000039)
(timed-prime-test 1000000000061)
(timed-prime-test 1000000000063)


; fast-expt would not serve well for our fast prime test because of how expensive the large number computations are. we will get the same results, but it will take much longer. 

