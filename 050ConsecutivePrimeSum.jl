#=Consecutive prime sum

The prime 41, can be written as the sum of six consecutive primes:
41 = 2 + 3 + 5 + 7 + 11 + 13

This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?
=#

using Primes

function naive(N=10^6)

    primez = primes(1,N)

    best = 0
    size = 0
    for a=1:length(primez)
        for b=a+1:length(primez) 
            n = sum(primez[a:b])
            n > N && break
            if isprime(n)
                l= length(primez[a:b])
                if l > size
                    best = n
                    size = l
                end
            end
        end
    end
    return best, size
end

@time naive() # 0.4s

function speed(N)
    # works for any N, so no hardcoded assumptions like some intuitive startingpoint in the first 10 primes
    primez = primes(1,N)
    best = 23
    size = 0
    diff = N 
    for a=1:length(primez)
        for b=a+best:length(primez) 
            n = sum(primez[a:b])
            n > N && break
            primez[b+1] > diff && return best, size
            if isprime(n)
                l= length(primez[a:b])
                if l > size
                    best = n
                    size = l
                    diff = N - n
                end
            end
        end
    end
    return best, size
end

@time speed(10^7) #0.003s