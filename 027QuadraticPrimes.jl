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

f(n,a,b) = n^2 + a*n + b # n(n+a)+b if n==b its te line always stops

const PRIMES = primesbelow(f(998,999,999))
isprime2(a) = a ∉ PRIMES ? 1 : 0


∏, hi = 0, 0
@time for b=primesbelow(1000)[end:-1:1], a=-999:2:999
    hi > b && break
    if b > (a^2 / 4)
        for n=0:b
            if f(n, a, b) ∉ PRIMES 
                if n-1 > hi
                    hi = n-1
                    ∏ = a*b
                end
                break
            end
        end
    end
end
∏