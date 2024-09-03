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



; fast-prime?

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
         m))
  (else
    (remainder (* base (expmod base (- exp 1) m))
               m))))

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
 (timed-prime-test 10037) 
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


; i expect the the runtime of 1,000,000 (7 digits) to be roughly two times slower than 1,000 (4 digits).

; in testing i observed a number with twice as many digits is roughly twice as slow.

; the fermat test has logarithmic growth so the runtime should only increase by a constant factor proportional to the input. i believe we are seeing the runtime double because of the operations that have to be performed as the input increases. even though the number of recursive calls grows logarithmically with respect to the size of the number, each multiplication operation involves larger numbers.
