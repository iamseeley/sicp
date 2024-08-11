; iterative vs. recursive processes

; inc increments its argument by 1
; dec decrements its argument by 1

; recursive

(define (+ a b)
  (if (= a 0)
    b
    (inc (+ (dec a) b))))

; (+ 2 8)
; (inc (+ 1 8))
; (inc (inc (+ 0 8)))
; (inc (+ 1 8))
; (+ 2 8)
; 10

; iterative

(define (+ a b)
  (if (= a 0)
    b
    (+ (dec a) (inc b))))

; (+ 2 8)
; (+ 1 9)
; (+ 0 10)
; 10

