# https://projecteuler.net/problem=28

diagNums = 1
x = 1
for dx=2:2:1000, _ = 1:4
    x += dx
    diagNums += x
end
diagNum 