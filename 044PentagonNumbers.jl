#=

Pentagonal numbers are generated by the formula, Pn=n(3n−1)/2. The first ten pentagonal numbers are:

1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...

It can be seen that P4 + P7 = 22 + 70 = 92 = P8. However, their difference, 70 − 22 = 48, is not pentagonal.

Find the pair of pentagonal numbers, Pj and Pk, for which their sum and difference are pentagonal and 
D = |Pk − Pj| is minimised; what is the value of D?
=#

P(n) = n*(3n-1)/2
N(p) = (√(24p+1)+1)/6 # inverse

@time for i=2:10000, j=1:i
    a, b = P(i), P(j)
    if isinteger(N(a+b)) && isinteger(N(a-b))
        println("$a - $b = $(a-b)")
        break
    end
end