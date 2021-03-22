#=
Goldbach's other conjecture

It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.

9 = 7 + 2×1^2
15 = 7 + 2×2^2
21 = 3 + 2×3^2
25 = 7 + 2×3^2
27 = 19 + 2×2^2
33 = 31 + 2×1^2

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?
=#
# prime generator sleave from p10
include("primes.jl")
@time primes = primesbelow(1e5)

function check(i)
    j = 1
    while primes[j] < i
        √((i-primes[j])/2) % 1 == 0 && return true
        j += 1
    end
    return false
end

function main()
    for i = 9:2:1e5
        !check(i) && i∉primes && return i
    end
end

@time main()