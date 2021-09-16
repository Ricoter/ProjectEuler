using Primes

function solve(N)
    # Generate Primes
    primesA = primes(floor(Int, N ^ (1/2))) #.^ 2
    primesB = primes(floor(Int, N ^ (1/3))) #.^ 3
    primesC = primes(floor(Int, N ^ (1/4))) #.^ 4

    nums = [a^2 + b^3 + c^4  for a ∈ primesA, b ∈ primesB, c ∈ primesC]
    return length(unique(nums[nums .<= N]))
end

@time solve(5e7)