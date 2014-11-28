import Timer
import Data.List

main = timeAndPrintAction $ print (foldl' (+) 0 [1..10000000])
