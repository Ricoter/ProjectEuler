#=Double-base palindromes


The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)
=#


ispalindrome(n) = string(n) == string(n)[end:-1:begin]

@time dec = (0:999999)[ispalindrome.(0:999999)] # Decimal palindromes
@time bin = parse.(BigInt, bitstring.(dec))     # to binary
@time sum(dec[ispalindrome.(bin)])              # sum overlap
