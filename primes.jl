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

# In combination with primes it returns all proper divisors of N
properDivisors(primes) = unique(collect(combinations(primes)))

# include("010SumOfPrimes.jl") # isprime(); primebelow()
function isprime(i, primes)
    for p in primes
        √i < p && break
        i%p==0 && return false
    end
    return true
end

function primesbelow(n)
    primes = [2]
    i = 3
    while i < n
        isprime(i, primes) && append!(primes, i)
        i += 2
    end
    return primes
end
