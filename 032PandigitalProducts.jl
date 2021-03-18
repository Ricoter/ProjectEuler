#=
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.

The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.
HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
=#
using Combinatorics

∏s = Set() # Keep track of unique products

@time for (a,b,c,d,e,f,g,h,i) ∈ permutations(1:9)
    ∏ = 1000*f + 100g+ 10h + i # product is always a 4-digit

    # All possible multiplicand/multiplier/product identities
    a * (1000b+100c+10d+e) == ∏ && push!(∏s, ∏)
    (10a+b) * (100c+10d+e) == ∏ && push!(∏s, ∏)
    (100a+10b+c) * (10d+e) == ∏ && push!(∏s, ∏)
    (1000a+100b+10c+d) * e == ∏ && push!(∏s, ∏)
end
sum(∏s)