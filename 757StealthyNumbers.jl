#=
https://projecteuler.net/problem=757
=#

using Primes

function isstealthy(n)
    nums = factor(n)

    
end

# isstealthy(36)
n = 36

nums = factor(n)

i, j, k, l = 20, 17, 19, 19
a = i*j
b = k*l
c = i*k
d = j*l

# a*b, c*d

a+b, c+d