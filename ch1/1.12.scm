; write a procedure that computes elements of Pascal's triangle by means of a recursive process.


(define (pascal r c)
  (if (or (= c 1) (= c r))
    1
    (+ (pascal (- r 1) (- c 1)) (pascal (- r 1) c))))


