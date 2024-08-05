(define (p) (p))

(define (test z y)
  (if (= x 0)
    0
    y))

;; applicative order behavior:
;; (evaluate arguments and then apply) 
;; before test can be applied, both 0 and pneed to be evaluated. the interpreter tries to evaluate p, which results in a recursive call to p that continues indefinitely because p calls itself recursively without a termination condition. so, the evaluation of p never completes.

;; normal order behavior:
;; (expand and reduce: the arguments to a function are not evaluated until their values are actually needed) 
;; the function test is applied with x bound to 0 and y bound to p, but p is not evaluated yet. then, the if expression inside test is evaluated. the predicate x is 0, so the predicate evaluates to true. since the predicate is true, the consequent 0 is returned, and the alternative y (which is p) is never evaluated.
;; so, with a normal-order interpreter, the expression (test 0 (p)) evaluates to 0 without causing infinite recursion because p is never actually evaluated.
