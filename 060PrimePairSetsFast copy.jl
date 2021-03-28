#=
The primes 3, 7, 109, and 673, are quite remarkable. By taking any two primes and 
concatenating them in any order the result will always be prime. For example, 
taking 7 and 109, both 7109 and 1097 are prime. The sum of these four primes, 792, 
represents the lowest sum for a set of four primes with this property.

Find the lowest sum for a set of five primes for which any two primes concatenate 
to produce another prime.
=#

using Primes, Combinatorics, BenchmarkTools

primez = primes(3,10000)

# concatenate the digits of i and j, returns integer
ccat(i::Int, j::Int) = i*10^ndigits(j) + j ::Int
checkDuo(i::Int, j::Int) = isprime(ccat(i, j)) && isprime(ccat(j, i)) ::Bool
checkDuo(A) = isprime(ccat(A[1], A[2])) && isprime(ccat(A[2], A[1])) ::Bool
checkArr(A) = 0 ∉ checkDuo.(combinations(A, 2))

function findPairs(primez, currentset=[])
    # 1. for each prime find larger primes that match (only larger to prevent doubles)
    # so d[3] = [7, .. ] with only larger primes in the list, this gives new (much smaller)
    # lists of possible prime numbers that already commonly match the previous one in the set 
    d = Dict()
    for (a, b) ∈ combinations(primez, 2)
        if checkDuo(a, b)
            a ∈ keys(d) ? push!(d[a], b) : d[a]=[b]
        end
    end

    # 2. Loop over the dict but start at the smallest prime as that makes more sense
    # if we want the smallest sum
    for k in sort(collect(keys(d)))
        v = sort(d[k])
        newset = [currentset; k]
        if length(newset) == 4
            println(sum([newset; v[1]]))
        end
        findPairs(v, newset)
    end
end
@benchmark findPairs(primez)
