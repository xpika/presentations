(defn fib [x] 
 (if 
   (< 2 x) 
   (+ (fib (- x 1)) 
      (fib (- x 2)))
    1))

(println "fib: " 38)
(println (fib 38))
