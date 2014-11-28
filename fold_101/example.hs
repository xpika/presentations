

reverse_slow xs = case xs of (x:xs) -> xs ++ [x] ; [] -> []
reverse_fast xs = foldl (flip (:)) [] xs