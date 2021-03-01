
# This seems like a slow problem, so let's just start by designing it with speed

# 1. Compute the chain length from every number only once by storing it in a collection
# 2. Use a Dict because it has a fast look

next(n) = n%2==0 ? n/2 : 3n+1       # Collatz evolution function

numbers = Dict(1=>1)                # number => chainlength
@time for n=2:1e6
    _chain = [n]                    # save local chain
    while n ∉ keys(numbers)         # evolve till you find a known number
        n = next(n)      
        append!(_chain, n)
    end

    chainLength = numbers[n]        # get the chain length of the known number
    for _n in _chain[end-1:-1:1]    # add local chain to known numbers
        chainLength += 1
        numbers[_n] = chainLength
    end
end
findmax(numbers)[2]