{-# LANGUAGE NoMonomorphismRestriction #-}

import System.IO.Unsafe
import Control.Monad

-- io not deferred 
eg1 = replicateM 2 (getLine) 
      >>= return . take 1

-- io deferred 
eg2 = replicateM 2 (unsafeInterleaveIO getLine) 
      >>=  return . take 1
