function primes(N)
    """Returns a list of the prime factors of N"""
    primes = []
    while N%2==0
        append!(primes,2)
        N ÷= 2
    end
    
    f = 3
    while N > 1
        while N%f==0
            append!(primes,f)
            N ÷= f
        end
        f += 2
    end
    return primes
end

include("010SumOfPrimes.jl")