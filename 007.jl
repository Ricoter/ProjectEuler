function findPrime(n)
    primes = [2]
    i = 3
    while length(primes) < n
        0 ∉ (i .% primes) && append!(primes, i)
        i += 2
    end
    return primes[end]
end

@time findPrime(10001)