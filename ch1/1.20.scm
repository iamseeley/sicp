; greatest common denominator
; w/ normal-order evalutation


(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b)))) 

; illustration of normal-order evaluation for (gcd 206 40):
 
#|
1. (gcd 206 40)
2. (if (= 40 0) 206 (gcd 40 (remainder 206 40)))
3. (gcd 40 (remainder 206 40))
4. (if (= (remainder 206 40) 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
5. (if (= 6 0) 40 (gcd 6 (remainder 40 6)))
6. (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
7. (if (= (remainder 40 (remainder 206 40)) 0) (remainder 206 40) (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
8. (if (= 4 0) (remainder 206 40) (gcd 4 (remainder 6 4)))
9. (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
10. (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) (remainder 40 (remainder 206 40)) (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder 2 (remainder 4 2))))
11. (if (= 2 0) (remainder 40 (remainder 206 40)) (gcd 2 0))
12. (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
13. (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0) 0 (remainder 40 (remainder 206 40)))
14. (if (= 0 0) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
15. (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
16. End of recursion, return value: 2

Summary of remainder operations:
- remainder(206, 40) is evaluated 6 times
- remainder(40, 6) is evaluated 6 times
- remainder(6, 4) is evaluated 4 times
- remainder(4, 2) is evaluated 2 times
Total remainder operations: 18
|#

; applicative order:
(gcd 206 40)
(gcd 40 6)
(gcd 6 4)
(gcd 4 2)
(gcd 2 0)

; test
(trace gcd)
(gcd 206 40)
