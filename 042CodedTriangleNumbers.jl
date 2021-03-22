#=
The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so the first ten triangle numbers are:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. 
For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we shall call the word a triangle word.

Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, how many are triangle words?
=#
using BenchmarkTools

t(n) = n/2*(n+1)     # Triangle fn
first100 = t.(1:100) # get first 100

istriangle(n) = n ∈ first100                     # Check if wordValue in first 100
wordValue(word) = sum(collect(word) .- 'A' .+ 1) # Get word value

function p042()
    # Open words in array
    x = readlines("input/042Words.txt")[1]
    x = split(x, ",")
    x = strip.(x, '"')

    # Solve problem vectorized
    x = wordValue.(x)
    sum(istriangle.(x))
end
@benchmark p042() # 0.001s