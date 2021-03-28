# https://projecteuler.net/problem=57

# 1/2
# 2/5
# 5/12
# 12/29
# 29/70


# *2 (+0 +1 +2 +5 +12)

# 1  2  5  12   29
#  +1 +3 +7  +17

n = 0
a, b = big(1), 2
@time for i=1:1000
    # check
    ndigits(a+b) > ndigits(b) && (n+=1)

    # update
    _a = b
    b += a + b
    a = _a
end
print(n)
