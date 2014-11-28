import System.Process
import Control.Exception
import System.IO
import System.Exit
import Data.List
import System.Directory

runAndPrint xs = do
                putStrLn (concat (intersperse " " xs))
                (run xs) >>= putStr

run (x:xs) = do 
             (_, Just hout, _,  processHandle) <- createProcess (proc x xs){ std_out = CreatePipe } 
             res <- hGetContents hout
             waitForProcess processHandle
             return res
      

main = do
  runAndPrint ["runhaskell","foldl.hs"]
  runAndPrint ["runhaskell","foldl_strict.hs"]
  copyFile "foldl.hs" "foldl_binary.hs"
  copyFile "foldl_strict.hs" "foldl_strict_binary.hs"
  run ["ghc","--make","-O2","foldl_binary.hs"]
  run ["ghc","--make","-O2","foldl_strict_binary.hs"]
  runAndPrint ["foldl_binary"]
  runAndPrint ["foldl_strict_binary"]