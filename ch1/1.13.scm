;;; Prove that Fib(n) is the closest integer to n / 5, where = (1 + 5)/2. 
;;; Hint: Let =(1 - 5)/2.
;;; Use induction and the definition of the Fibonacci numbers (see section 1.2.2) to prove that Fib(n) = (n -n)/ 5.

;;; Proposition:
;;; For all non-negative integers n, the nth Fibonacci number Fib(n) is given by:
;;; Fib(n) = (phi^n - psi^n) / sqrt(5)
;;; where phi = (1 + sqrt(5)) / 2 and psi = (1 - sqrt(5)) / 2.

;;; Base Case:
;;; Prove for n = 0:
;;; Fib(0) = 0 and (phi^0 - psi^0) / sqrt(5) = 0
;;; Prove for n = 1:
;;; Fib(1) = 1 and (phi^1 - psi^1) / sqrt(5) = 1

;;; Inductive Hypothesis:
;;; Assume Fib(k) = (phi^k - psi^k) / sqrt(5) and Fib(k-1) = (phi^{k-1} - psi^{k-1}) / sqrt(5) for some arbitrary integer k ≥ 0.

;;; Inductive Step:
;;; Show that if the statement is true for n = k, then it is true for n = k+1.
;;; Starting from the recursive definition of Fibonacci numbers:
;;; Fib(k+1) = Fib(k) + Fib(k-1)
;;; Substitute the inductive hypothesis:
;;; Fib(k+1) = (phi^k - psi^k) / sqrt(5) + (phi^{k-1} - psi^{k-1}) / sqrt(5) = (phi^{k+1} - psi^{k+1}) / sqrt(5)

;;; Conclusion:
;;; By the principle of mathematical induction, the formula holds for all n ≥ 0.
;;; Thus, Fib(n) = (phi^n - psi^n) / sqrt(5) for all n ≥ 0.

