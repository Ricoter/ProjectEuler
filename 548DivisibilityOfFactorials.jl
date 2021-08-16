#=
The smallest number m such that 10 divides m! is m=5.
The smallest number m such that 25 divides m! is m=10.

Let s(n) be the smallest number m such that n divides m!.
So s(10)=5 and s(25)=10.
Let S(n) be ∑s(i) for 2 ≤ i ≤ n.
S(100)=2012.

Find S(108).
=#
include("primes.jl")
primes = primes()
function s(n)
    m = 0
    while true
        factorial(big(m)) % n == 0 && return m
        m += 1
    end
end

function s(n)
    """Return largest prime factor for a natural number."""
    f = 2
    n%f == 0 && n /= f

    f += 1 
    while n > 1
        n%f==0 && n÷=f
        f += 2
    end
    return f
end


@time sum(s.(2:1e5))