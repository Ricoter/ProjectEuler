# https://projecteuler.net/problem=745
using Primes, DataStructures

function S(N)
    """
        - find max root
        - list square up to N
    """
    root = floor(Int, √N)
    squares = (1:root) .^ 2  

    total = 0
    for s in squares
        
        x = N÷s
        total += 2s*x - sum(squares[s.%squares.==0] * x)
        total %= 1000000007
    end
    total
end

# factor(SortedDict, 100)

S(10^14)