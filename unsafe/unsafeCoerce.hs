
{-# LANGUAGE NoMonomorphismRestriction #-} 

import Unsafe.Coerce
import Control.Monad.Fix

y :: (a -> a) -> a
y = \f -> (\x -> f (unsafeCoerce x x)) (\x -> f (unsafeCoerce x x))

fac = \a b -> if b == 1 then 1 else b*a (b-1)

main = do 
       print $ y fac 5
       print $ fix fac 5


