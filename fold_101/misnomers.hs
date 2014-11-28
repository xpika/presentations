

eg1a = foldl1 (^) (reverse [2,3,4])
eg1b = foldr1 (^) (reverse [2,3,4])

eg1_1a = foldl1 (++) (reverse ["hello","world"])
eg1_1b = foldr1 (++) (reverse ["hello","world"])

eg2a = take 10 $ foldr (:) [] (repeat 1)
eg2b = take 10 $ foldl (flip (:)) [] (repeat 1)

