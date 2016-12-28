 ```
 mapM (\x->  unsafeInterleaveIO (  putStrLn "Enter a name:" >> x ) )  [getLine,getLine,getLine] >>= \x -> let a=   ( takeWhile (/="john") x) in foldr seq () a `seq` print 
 
 ```
