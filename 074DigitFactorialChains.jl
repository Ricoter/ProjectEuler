function solve(n)
    nlist = [n]
    for i=2:60
        n = sum(factorial.(digits(n)))
        n ∈ nlist && return 0
        push!(nlist, n)
    end
    return 1
end
@time sum(solve.(1:1000000))