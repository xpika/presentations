{-# LANGUAGE NoMonomorphismRestriction #-}

import Data.Char
import Text.HTML.TagSoup
import Text.HTML.TagSoup.Tree
import System.IO


 -- code to extract today's featured article from Wikipedia

main = do
  -- after doing wget https://en.wikipedia.org/wiki/Main_Page
  handle <- openFile "Main_Page.html" ReadMode
  hSetEncoding handle utf8_bom
  contents <- hGetContents handle
  let html = renderTags . head . filter ((~== "<div id=mp-tfa>") . head) $ map flattenTree $ map (\x ->[x])  $  universeTree $ tagTree $ parseTags contents
  hSetEncoding stdout utf8_bom
  putStr html
  
main2 = do 
        let a = renderTags $ flattenTree $ transformTree f $ tagTree  $ parseTags "<div><div>test</div></div>"
        print a
        return 32
        
    -- remove redundant divs
f (TagBranch "div" atts [TagBranch "div" atts2 inner] ) = [TagBranch "div" atts inner]
f x = [x]


trans = undefined