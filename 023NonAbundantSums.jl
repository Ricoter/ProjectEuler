using Combinatorics
include("primes.jl")

d(primes) = sum(unique(prod.(collect(combinations(primes))))[1:end-1], init=1)

function p23(i=1:28123)
    abun = i[i .< d.(primes.(i))]
    sums = unique(abun .+ abun')
    iArr = collect(i)
    filter!(e -> e ∉ sums, iArr)
    sum(iArr)
end

@time p23()