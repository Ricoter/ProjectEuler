#=
The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
=#


using Combinatorics

include("primes.jl")

function p35()
    global PRIMES = collect.(string.(primesbelow(1e6))) # From p10

    # Remove all primes with some even number
    PRIMES = [n for n in PRIMES if 0 ∉ (parse.(Int, n) .% 2) ]

    function allprimes(n)
        # digits = parse.(Int, collect(string(n)))
        for shift=1:length(n)
            _n = circshift(n, shift)

            _n ∉ PRIMES && return 0
        end
        return 1
    end

    sum(allprimes.(PRIMES)) + 1 # +1 for 2
end

@time p35()