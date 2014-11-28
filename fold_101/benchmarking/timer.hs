module Timer where


import System.Process
import Control.Exception
import System.IO
import System.Exit
import Text.Printf
import Data.Time
import Data.Char
import System.Random
import Data.List

timeAction action = do
  t1 <- getCurrentTime
  g <- action
  t2 <- getCurrentTime
  let timeInUnits = (realToFrac $ diffUTCTime t2 t1 :: Float) 
  return timeInUnits 
  
timeAndPrintAction action = do
  time <- timeAction action
  printf "%f\n" time