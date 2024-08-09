(define (square x) (* x x))

(define (abs x)
  (if (< x 0)
    (- x)
      x))


; original good-enough? test

(define (good-enough1? guess x)
  (< (abs (- (square guess) x )) 0.001))

; new test ensures accuracy across different scales

; decreased tolerance level for more precision

(define (good-enough? guess x)
  (< (/ (abs (- (square guess) x)) x) 0.00001))

(define (improve guess x)
  (/ (+ guess (/ x guess)) 2))


(define (sqrt-iter1 guess x)
  (display guess)
  (newline)
  (if (good-enough1? guess x)
    guess
    (sqrt-iter1 (improve guess x) x)))

(define (sqrt1 x)
  (sqrt-iter1 1.0 x))

(define (sqrt-iter guess x)
  (display guess) 
  (newline)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt1 0.04)

(sqrt1 10000) 


(sqrt 0.04) 

(sqrt 10000) 


; The original good-enough? test was slightly off on the smaller number due to the fixed tolerance. With the new relative scale test the iterations continued further and got closer to the actual root. For large numbers both tests had pretty much the same result, this means the original fixed tolerance test already worked well with large numbers.
