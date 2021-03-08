#=

A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation 
of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, 
we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:

012   021   102   120   201   210

What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
=#

function lexiPermutation(N, elements)
    # prep: start counting at 1 instead of 0
    N -= 1
    
    # step 1: First digit can choose from all elements, so L = length(elements)
    # second L-1, third L-2 etc. That means the nth digit changes upward every (n-1)!
    digitFactors = [factorial(n-1) for n=length(elements):-1:1]

    # 2. greedy algorithm: find combinations of factors with least used factors
    permuationArray = []
    for f in digitFactors
        d = Int(N÷f)
        N %= f
        append!(permuationArray, popat!(elements, d+1))    
    end
    
    return string(permuationArray...)
end

@time lexiPermutation(1e6, collect(0:9))