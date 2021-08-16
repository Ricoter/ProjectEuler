#= Problem 70

Euler's Totient function, φ(n) [sometimes called the phi function], is used to determine the number of positive numbers less than or equal to n which are relatively prime to n. For example, as 1, 2, 4, 5, 7, and 8, are all less than nine and relatively prime to nine, φ(9)=6.
The number 1 is considered to be relatively prime to every positive number, so φ(1)=1.

Interestingly, φ(87109)=79180, and it can be seen that 87109 is a permutation of 79180.

Find the value of n, 1 < n < 10^7, for which φ(n) is a permutation of n and the ratio n/φ(n) produces a minimum.
=#

using Primes, BenchmarkTools
p = prime.(1:64)

#=
- Numbers are better when the contain more primes, so the small primes are the best.
=#
function solve()
    """
        Defines a prime counting system
    """
    primelist = reverse(prime.(1:64))
    for n=1:100000000
        bits = parse.(Int,collect(bitstring(n))) # convert number to bitarray

        
        
        a = prod(primelist[bits.==1])
        a > 10^7 && continue
        b = totient(a)
        sort(digits(a)) == sort(digits(b)) && println(a)
    end
    
end

function solve2(n=10^7)
    root = floor(Int, √n)
    low = primes(root)
    hi = primes(root, n/2)
    for 
        root = prevprime(root-1)
        n = root^2
        t = totient(n)
        # println("$n, $t")
        sort(digits(n)) == sort(digits(t)) && return n
    end
end
# solve2()

n=10^7
root = floor(Int, √n)
low = primes(root)
hi = primes(root, n÷2)

function bruteforce(n = 2:10000000)
    totients = totient.(n)
    permumations = sort.(digits.(n)) .== sort.(digits.(totients))
    ratio = n ./ totients
    minarg = argmin(ratio[permumations.==1])
    solution = n[permumations.==1][minarg]
    return solution
end
# @benchmark bruteforce()

check(n) = sort(digits(n)) == sort(digits(totient(n)))

function rootgrow(N=10^7)
    """
        - A good candidate for max(n/ϕ(n)) is a high numerator with a low denominator
        - ϕ(n) is low for a n consiting out of two primes.
        - these two primes should be as large a possible, because lower primes create more coprimes
        - so we are looking for two primes that provide a large n when multiplied.
        - perfect place to start looking for primes is therefore √(10^7)
        - one number should be close above, other close below. Let's search
    """
    root = floor(Int, √N)
    low = prevprime(root-1)
    for _=1:500
        # check all primes, bigger than low, that make a number below N
        upper = N÷low
        hi = prevprime(upper)
        while hi > √N 
            n = hi * low
            check(n) && return n
            hi = prevprime(hi-1)
        end
        low = prevprime(low-1)
    end
end
@benchmark rootgrow()
