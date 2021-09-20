using Primes, Combinatorics

K = ones(12000) .*= Inf

function combine(factors, K)
    summation, product = sum(factors), prod(factors)
    leadingOnes = product - summation       # leading one's
    if leadingOnes >= 0
        _k = length(factors) + leadingOnes  # size of set _k
        1 < _k <= length(K) && (K[_k] = min(K[_k], product))
    else
        return nothing
    end

    for (a, b) in Set(combinations(factors, 2))
        _factors = copy(factors)
        deleteat!(_factors, findfirst(x->x==a, _factors))
        deleteat!(_factors, findfirst(x->x==b, _factors))
        push!(_factors, a*b)
        combine(_factors, K)
    end

end

function combine2()
    for i = 1:20000
        
    end 
end

n = 2
@time while Inf ∈ K[2:end]
    if isprime(n)
        n += 1
        continue
    end

    factors = factor(Vector, n)             # prime factors
    combine(factors, K)
    
    # do all combinations
    # combine(factors)


    n += 1

end 
sum(Set(K[2:end]))