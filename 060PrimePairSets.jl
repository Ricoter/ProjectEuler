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
            a ∈ keys(d) ? push!(d[a], b) : d[a]=[a, b]
            b ∈ keys(d) ? push!(d[b], a) : d[b]=[b, a]
        end
    end
    return d
end

function findTriples(primez)
    d = Dict()
    for (a, b, c) ∈ combinations(primez, 3) 
        if checkDuo(a,b)
            a ∈ keys(d) ? push!(d[a], b, c) : d[a]=Set([a,b,c])
            b ∈ keys(d) ? push!(d[b], a, c) : d[b]=Set([b,a,c])
            c ∈ keys(d) ? push!(d[c], a, b) : d[c]=Set([c,a,b])
        end
    end
    return d
end

d = findPairs(primes(3,10000))
quatros = []
for p in values(d)
    for c in combinations(p, 4)
        if checkArr(c)
            println(c)
            println(sum(c))
            push!(quatros, c)
        end
    end
end

println("find fifth")
new = nothing
for q in quatros
    for p in primes(maximum(q) + 1, 10000)
        new = [q; p]
        if checkArr(new)
            println(new)
            println(sum(new))
        end
    end
end



# d = findTriples(primes(3,1200))
# println("check")
# for p in keys(d)
#     # println(d)
#     for c in combinations(p, 4)
#         if checkArr(c)
#             println(c)
#             println(sum(c))
#         end
#     end
# end
# for c in combinations(collect(keys(d)), 4)
#     if checkArr(c)
#         println(c)
#         println(sum(c))
#     end
# end

# function find()
#    nothing 
# end

# function main()
#     badcombinations = []
#     for c in combinations(primes(3, 673), 4)
        
#         bad = false
#         for p in combinations(c, 2)
#             if checkDuo(p) == false
#                 push!(badcombinations, p)
#                 bad = true
#                 break
#             end
#         end; bad && continue
        
#         println(c)
#         println(sum(c))
#     end
# end
# main()

# on the way I found that finding 3s

