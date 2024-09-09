(define (car-test n)
  (define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

  (define (car-test-iter n a)
    (cond ((or (= n 1) (= n 0)) #f)  ; n = 0 or 1 cannot be Carmichael numbers
          ((= a n) #t)               ; All tests passed, return true
          ((not (= (gcd a n) 1)) (car-test-iter n (+ a 1))) ; Skip if a is not coprime with n
          ((not (= (expmod a n n) a)) #f) ; If any test fails, return false
          (else (car-test-iter n (+ a 1))))) ; Continue testing next a
  
  ;; Start the iteration from a = 1
  (car-test-iter n 1))

(define (expmod base exp m)
  (cond ((= exp 0) 1) ; Base case: any number to the power of 0 is 1
        ((even? exp)  ; If exp is even
         (remainder (square (expmod base (/ exp 2) m)) m)) ; Square the result of the half exponentiation
        (else         ; If exp is odd
         (remainder (* base (expmod base (- exp 1) m)) m)))) ; Multiply base by the result of exp-1 exponentiation

(define (square x) (* x x))

;; Test cases
(display (car-test 561))   ; Should return #t
(newline)
(display (car-test 1105))  ; Should return #t
(newline)
(display (car-test 1729))  ; Should return #t
(newline)
(display (car-test 129))   ; Should return #f
(newline)
(display (car-test 2465))  ; Should return #t
(newline)
(display (car-test 2821))  ; Should return #t
(newline)
(display (car-test 6601))  ; Should return #t
(newline)
(display (car-test 240))   ; Should return #f
(newline)
