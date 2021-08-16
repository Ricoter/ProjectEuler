using Primes

primez = primes(6000000)

function F(p)
    n = 0
    for a=1:(p-1), b=1:(p-1), c=1:(p-1)
        (a^3 + b^3) %p == (c^3)%p && (n+=1)
    end
    return n
end

@time F(primez[200])

primez

