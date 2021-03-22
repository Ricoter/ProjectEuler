#=
Distinct primes factors


The first two consecutive numbers to have two distinct prime factors are:

14 = 2 × 7
15 = 3 × 5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2² × 7 × 23
645 = 3 × 5 × 43
646 = 2 × 17 × 19.

Find the first four consecutive integers to have four distinct prime factors each. What is the first of these numbers?

=#
using BenchmarkTools

function primeFactors(N)
    """Returns a list of the prime factors of N"""
    primes = Set()
    while N%2==0
        push!(primes,2)
        N ÷= 2
    end
    
    f = 3
    while N > 1
        while N%f==0
            push!(primes,f)
            N ÷= f
        end
        f += 2
    end
    return primes
end
    
function primeFactors2(Ni)
    N = Ni
    """Returns a list of the prime factors of N"""
    primes = 0
    if N%2==0
        primes += 1
        while N%2==0
            N ÷= 2
        end
        Ni = N
    end
    
    f = 3
    while N^2 > Ni
        if N%f==0
            primes += 1
            while N%f==0
                N ÷= f
            end
        end
        f += 2
        Ni = N
    end
    return primes
end

using Primes

function main(i=0, n=2)
    while true
        # if length(primeFactors(n))==4
        # if primeFactors2(n) == 4
        if length(factor(n)) == 4
            i += 1
            if i==4 
                return(n-3)
            end
        else
            i=0
        end
        n+=1
    end
end

@benchmark main()


# include("primes.jl")

# function main2()
        
#     PB = primesbelow(1e3)

#     function primeFactors2(N)
#         """Returns a list of the prime factors of N"""
#         i = 1
#         c = 0
#         while PB[i] < √N
#             N%PB[i] ==0 && c += 1
#             i += 1
#         end
#         return c
#     end

#     n,i= 1,0
#     while true
#         if primeFactors2(n)==4
#             i += 1
#             if i==4 
#                 return(n-3)
#             end
#         else
#             i=0
#         end
#         n+=1
#     end
# end

# @time main2()