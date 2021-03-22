#=
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
=#
using BenchmarkTools

function nextPalindrome(p)
    """Retuns next lower palindrome number from given palindrome"""
    s = string(p)
    l = length(s)
    a = parse(Int, s[1:ceil(Int, l/2)])
    a = string(a-1) 
    b = a[l÷2:-1:1]
    return parse(Int, a*b)
end


function findLargestPalindrome(n)
    """Returns largest palindrome made from the product of two n-digit numbers """
    p = 10^2n-1 # 3-digit pal should be between 999999 and 100001
    # p=big(p)
    while (p = nextPalindrome(p)) > 10^(2n-1)
        p = BigInt(p)
        for i = ceil(Int, √p):10^n-1
            j = p/i
            isinteger(j) && (println("$i * $(Int(j)) = $p"); return p)
        end
    end
end

@time findLargestPalindrome(8)

ispalindrome(n) = string(n) == string(n)[end:-1:1]

function bruteforce(n=3)
    interval = 10^(n-1):10^n-1

    maxNum = 0
    for i=interval, j=interval
        p = i*j
        ispalindrome(p) && (maxNum = max(maxNum, p))
    end

    return maxNum
end

@time bruteforce()

function nextPalindrome(p)
    """Returns next lower palindrome number from given palindrome"""
    a = parse(Int, string(p)[1:3]) - 1
    p = string(a) * string(a)[end:-1:1]
    return parse(Int, p)
end

function largestPalindrome()
    p = 999^2
    while (p = nextPalindrome(p)) >= 100^2
        for i = ceil(Int, √p):999
            j = p/i
            isinteger(j) && return p
        end
    end
end