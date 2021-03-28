using Primes, Combinatorics

primez = primes(3,10000)

ccat(i::Int, j::Int) = i*10^ndigits(j) + j ::Int
checkDuo(i::Int, j::Int) = isprime(ccat(i, j)) && isprime(ccat(j, i))

function check(A)
    for (a, b) in combinations(A, 2)
        !checkDuo(a, b) && return false
    end
    return true
end



function findset(arr=[3], L=5, maxprime=10000)
    if length(arr) == L
        println(arr)
        println(sum(arr))
        return true
    end

    for p in primes(arr[end] , maxprime), 
        new = [arr; p]
        if check(new)
            findset(new) && return true
        end
    end
    return false
end

findset([3], 4, 1000)
