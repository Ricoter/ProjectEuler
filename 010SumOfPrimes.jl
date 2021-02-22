#=
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
=#

function primesSlow(n)
    primes = [2]
    i = 3
    while primes[end] < n
        0 ∉ (i .% primes) && append!(primes, i)
        i += 2
    end
    return primes[1:end-1]
end

function primesLessSlow(n)
    primes = [2,3,5,7,11,13,17, 19, 23]
    i = 19
    while primes[end] < n
        if 0 ∉ (i .% primes[1:7]) && 0 ∉ (i .% primes[8:end])
            append!(primes, i)
        end
        i += 2
    end
    return primes[1:end-1]
end

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


function slieveprimes(n)
    nums = 2:n
    primeSum = 0
    while length(nums) > 0
        primeSum += nums[1]
        nums = nums[nums .% nums[1] .!= 0]
        nums[1] > √n && break
    end
    return primeSum
end
@time slieveprimes(n)

