(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
    (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

; what happens when we use sqrt-iter to compute square roots?

; cond is a special form that evaluates its conditions one by one and returns the result of the first true condition. when new-if is called, all its arguments are evaluated before the cond expression is executed.
; when new-if is invoked in sqrt-iter, both the then-clause and the else-clause are evaluated regardless of the predicate's result. this is different from the built-in if, which only evaluates either the then-clause or the else-clause based on the predicate's result.
; sqrt-iter recursively calls itself, so it calls new-if again. this causes infinite recursion because every call to new-if will evaluate both the then-clause and the else-clause, leading to another call to sqrt-iter, and so on.



