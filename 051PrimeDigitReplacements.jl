#=
By replacing the 1st digit of the 2-digit number *3, it turns out that six of the possible
values: 13, 23, 43, 53, 73, and 83, are all prime.

By replacing the 3rd and 4th digits of 56**3 with the same digit, this 5-digit number is the
first example having seven primes among the ten generated numbers, yielding the family: 56003,
56113, 56333, 56443, 56663, 56773, and 56993. Consequently 56003, being the first member of 
thisfamily, is the smallest prime with this property.

Find the smallest prime which, by replacing part of the number (not necessarily adjacent 
digits) with the same digit, is part of an eight prime value family.
=#

using Primes

function countuniques(arr)
    d = Dict()
    for x in arr
        if x ∈ keys(d)
            d[x] += 1
        else
            d[x] = 1
        end
    end
    return d
end

function mask(s, pos)

    # returns s if digits are not the same
    n = s[pos[1]]
    for i ∈ pos
        s[i] != n && return s
    end

    # mask digits if they are the same
    _s = copy(s)
    for i ∈ pos
        _s[i] = 'x'
    end
    return _s
end

function naive(n)
    primez = primes(10^(n-1),10^n)      # get sleave
    primez = collect.(string.(primez))  # to arrays

    for a=1:n-3, b=a+1:n-2, c=b+1:n-1
        masked = mask.(primez, Ref([a, b, c]))               # mask 3 digits
        uniques = countuniques(masked)                       # count unique masks
        best = findmax(uniques)                              # get the best one (only works with single solution!)
        if best[1] >= 8
            solution = minimum(primez[masked .== [best[2]]]) # get the minimum value in the list of primes
            return parse(Int, string(solution...))           # to integer
        end
    end

    return naive(n+1)
end

@time naive(6)