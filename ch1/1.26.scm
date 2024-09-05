; pulled from expmod function

; Louis' version

(remainder (* expmod base (/ exp 2) m)
           (expmod base (/ exp 2) m))
          m))

; verison w/ square

(remainder (square (expmod base (/ exp 2) m))
         m))

; By replacing the call to square with two recursive calls, Louis transformed a logarithmic-time process into a linear-time process. The original function was efficient, reducing the problem size by half at each step, whereas the modified function makes the same calculation twice, resulting in an exponential increase in the number of function calls.

; Original (with square): Makes one recursive call, computes the result, and then squares it. This allows the recursion depth to grow logarithmically with the exponent exp. 

; Modified (without square): Makes two recursive calls for every even exp, leading to a binary tree structure of calls. Each level of recursion doubles the number of calls, leading to exponential growth in the number of calls.
