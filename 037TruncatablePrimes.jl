
include("primes.jl") # import primes sleave generator from problem 10

digits(n) = parse.(Int, collect(string(n)))
number(digits) = parse(Int, string(digits...))


function lTrunc(n)
    n ∉ primes && return false
    return length(n) > 1 ? lTrunc(n[2:end]) : true
end

function rTrunc(n)
    n ∉ primes && return false
    return length(n) > 1 ? rTrunc(n[1:end-1]) : true
end

function p37()
    primes = primesbelow(1e6) # generates prime sleave from problem 10

    # number to digits
    primes = digits.(primes)

    # Remove primes containing non-prime digits
    primes = [n for n ∈ primes if 0 ∉ (n .∈ [[1,2,3,5,7,9]])]
    primes = [n for n ∈ primes if 0 ∉ isodd.(n[2:end])]

    # Remove primes with 2 of the same digits next to each other
    doubles(n) = sum([1 for i=1:length(n)-1 if n[i] == n[i+1]]) > 0
    primes = [n for n ∈ primes if !doubles(n)]

    l = lTrunc.(primes)
    r = rTrunc.(primes)

    # digits to number (skip 2,3,5,7)
    nums = number.(primes[l .& r])
    sum(nums[5:end])
end

@time p37()