#=
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?
=#
using Combinatorics

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
function p()

    primes = primesbelow(√987654322)


    for perm in permutations("7654321")
        n = parse(Int, string(perm...))
        if isprime(n, primes)
            println("$n")
            break
        end
    end
end
@time p()