fibPair n
    | n == 0 = (1,1)
    | n > 0 = fibNext(fibPair(n-1))

fibNext(m,n) = (n,m+n)
fibFast n = fst(fibPair(n))

main = print(fibFast(50))