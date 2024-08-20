


(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (display angle)
  (newline)
  (if (not (> (abs angle) 0.1))
    angle
    (p (sine (/ angle 3.0)))))



; a. when (sine 12.15) is evaluated the procedure p is applied 5 times.

; (sine 12.15)
; p > (sine 4.05)
; p p > (sine 1.35)
; p p p > (sine 0.45)
; p p p p > (sine 0.15)
; p p p p p > (sine 0.05)


; b The sine procedure repeatedly reduces the argument angle by dividing it by 3 each time until it becomes less than or equal to 0.1. This implies that the number of recursive steps needed is proportional to the number of times you can divide a by 3 before it becomes less than or equal to 0.1. This is approximately log_3(a/0.1), which simplifies to log_3(a), making the order of growth in the number of steps O(log a).
; Since the process is recursive, each recursive call adds a new frame to the call stack. But, because the recursion is tail-recursive, Scheme can optimize the recursion to avoid additional space usage. Therefore, the space required is also O(log a).
