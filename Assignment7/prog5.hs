countLength:: [Int] -> Int
countLength [] = 0
countLength (x:xs) = 1 + countLength xs

main = print(countLength([1,2,3,4]))