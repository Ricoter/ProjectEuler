#=
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
=#
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

n = 2e5

@time sum(primesbelow(n))
