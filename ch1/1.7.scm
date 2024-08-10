(define (square x) (* x x))

(define (abs x)
  (if (< x 0)
    (- x)
    x))

; good-enough? test using previous-guess to ensure accuracy across different scales
(define (good-enough? guess previous-guess)
  (< (abs (- guess previous-guess)) 0.001))

(define (improve guess x)
  (/ (+ guess (/ x guess)) 2))

(define (sqrt-iter guess previous-guess x)
  (display guess)
  (newline)
  (if (good-enough? guess previous-guess)
      guess
      (sqrt-iter (improve guess x) guess x)))

(define (sqrt x)
  (sqrt-iter 1.0 0.0 x))

;; Testing with the adjusted function
(sqrt 0.04)
(sqrt 10000)


; The original good-enough? test was slightly off on the smaller number due to the fixed tolerance. With the new relative scale test the iterations continued further and got closer to the actual root. For large numbers both tests had pretty much the same result, this means the original fixed tolerance test already worked well with large numbers.
