using Primes

function solve(N)
    # Generate relevant primes
    primesA = primes(floor(Int, N ^ (1/2))) #.^ 2
    primesB = primes(floor(Int, N ^ (1/3))) #.^ 3
    primesC = primes(floor(Int, N ^ (1/4))) #.^ 4

    # Create matrix with all possible additions
    nums = [a^2 + b^3 + c^4  for a ∈ primesA, b ∈ primesB, c ∈ primesC]

    # Count unique values smaller than N
    return length(Set(nums[nums .<= N]))
end

@time solve(5e7)