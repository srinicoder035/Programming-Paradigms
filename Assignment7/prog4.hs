countList = foldr (const(1+))0
main = print $ countList [1,2,3,4,5]