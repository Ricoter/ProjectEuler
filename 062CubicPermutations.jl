#=
Cubic permutations

The cube, 41063625 (345^3), can be permuted to produce two other cubes: 56623104 (384^3) 
and 66430125 (405^3). In fact, 41063625 is the smallest cube which has exactly three 
permutations of its digits which are also cube.

Find the smallest cube for which exactly five permutations of its digits are cube.
=#
using Combinatorics

cubics(n) = (ceil(Int, ∛(10^(n-1))):floor(Int, ∛(10^n-1))) .^ 3 # get all cubics of n digits

function occurences(col)
    "Returns occurences of collection    in a Dict"
    d = Dict()
    for x in col
        if x ∈ keys(d)
            d[x] += 1
        else
            d[x] = 1
        end
    end
    return d
end

function CubicPermutations(n=8, perm=5)
    cubes = cubics(n)                   # convert to digit array for fast permutation search
    sortedCubes = sort.(digits.(cubes)) # convert numbers to sorted arrays of digits permutations are now the same
    d = occurences(sortedCubes)         # count occurences
    perm ∉ values(d) && CubicPermutations(n+1)  # continue to next n if amount of permutations is not found
    for (k, v) in d
        v != perm && continue
        mincube = minimum(cubes[sortedCubes .== Ref(k)])
        println(mincube)
    end
end

@time CubicPermutations()