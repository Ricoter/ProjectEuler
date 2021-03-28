#=
The primes 3, 7, 109, and 673, are quite remarkable. By taking any two primes and 
concatenating them in any order the result will always be prime. For example, 
taking 7 and 109, both 7109 and 1097 are prime. The sum of these four primes, 792, 
represents the lowest sum for a set of four primes with this property.

Find the lowest sum for a set of five primes for which any two primes concatenate 
to produce another prime.
=#

using Primes, Combinatorics

primez = primes(1000)

# concatenate the digits of i and j, returns integer
ccat(i::Int, j::Int) = i*10^ndigits(j) + j ::Int
checkDuo(i::Int, j::Int) = isprime(ccat(i, j)) && isprime(ccat(j, i)) ::Bool
checkDuo(A) = isprime(ccat(A[1], A[2])) && isprime(ccat(A[2], A[1])) ::Bool
checkArr(A) = 0 ∉ checkDuo.(combinations(A, 2))
# duos(primez) = [pair for pair in combinations(primez, 2) if checkDuo(pair)]  


function findPairs(primez)
    d = Dict()
    for (a, b) ∈ combinations(primez, 2) 
        if checkDuo(a,b)
            a ∈ keys(d) ? push!(d[a], b) : d[a]=[b]
        end
    end
    return d
end

@time d = findPairs(primes(3,10000))

function findFifth(q)
    for p in primes(maximum(q) + 1, 10000)
        new = [q; p]
        if checkArr(new)
            println(new)
            println(sum(new))
            return true
        end
    end
    return false
end

function findSet(d)
    for (k,v) in d
        for c in combinations(v, 3)
            if checkArr(c)
                set = [k; c]
                findFifth(set) && return nothing
                # println(set)
                # println(sum(set))
                # return nothing
                # push!(quatros, set)
            end
        end
    end
end
# @time findSet(d)
# println("find fifth")
# new = nothing
function findSetfast(d)
    for k in sort(collect(keys(d)))
        println(k)
        v = d[k]
        for c in combinations(v, 3)
            if checkArr(c)
                set = [k; c]
                findFifth(set) && return nothing
                # println(set)
                # println(sum(set))
                # return nothing
                # push!(quatros, set)
            end
        end
    end
end
@time findSetfast(d)