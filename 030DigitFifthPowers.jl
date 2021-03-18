#=
Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

1634 = 14 + 64 + 34 + 44
8208 = 84 + 24 + 04 + 84
9474 = 94 + 44 + 74 + 44

As 1 = 14 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
=#
total = -1
@time for a=0:9, b=0:9, c=0:9, d=0:9, e=0:9, f=0:9
    n = 100000a + 10000b + 1000c + 100d + 10e + f
    n == a^5+b^5+c^5+d^5+e^5+f^5 && (total += n)
end
total


