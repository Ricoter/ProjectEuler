#=
Prime permutations

The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: 
(i) each of the three terms are prime, and, 
(ii) each of the 4-digit numbers are permutations of one another.

There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, 
but there is one other 4-digit increasing sequence.

What 12-digit number do you form by concatenating the three terms in this sequence?
=#

using Primes, Combinatorics, BenchmarkTools

function aritmeticPrimes(n, perms)
    for diff in 1:(n-1000)÷1
        count = 0
        for i=1:2
            next = n-i*diff
            (isprime(next) && next ∈ perms) ? count+=1 : break
            if count == 2
                s = join([n-2diff, n-diff, n])
                s != "148748178147" && return s
            end
        end
    end
end

function main()
    for n in prevprimes(9999)
        s = string(n)
        perms = parse.(Int, join.(permutations(s)))
        if (s = aritmeticPrimes(n, perms)) != nothing
            print(s)
            break
        end
    end
end

@time main()