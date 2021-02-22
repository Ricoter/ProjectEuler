#=
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
=#


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

    while (p = nextPalindrome(p)) > 10^(2n-1)

        for i = ceil(Int, √p):10^n-1
            j = p/i
            isinteger(j) && return p
        end
    end
end

@time findLargestPalindrome(3)

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

