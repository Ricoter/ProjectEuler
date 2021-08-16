#=
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
=#
using Yao

function reduction(n)
    y = log2(n)
    for b = 2:ceil(Int, y)
        x = 2^(y/b)
        u1 = floor(Int, x)
        u1^b == N && return (u1, b)
        (u1+1)^b == N && return (u1+1, b)
    end
end

function shor(N::Int)
    """
    Shor's algorithm consists of two parts:

    1. A reduction, which can be done on a classical computer, 
    of the factoring problem to the problem of order-finding.

    2. A quantum algorithm to solve the order-finding problem.
    This part will be simulated with a clasical computer using the Yao library
    """
    res = reduction(N)
    re
