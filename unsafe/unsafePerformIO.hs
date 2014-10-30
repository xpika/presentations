import System.IO.Unsafe

traceMessage x = unsafePerformIO (putStrLn x >> return id)

fac 1 = 1
fac n = (traceMessage (show n) n)  * fac (n-1) 

main = print (fac 5)


