#=
Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20×20 grid?
=#

# z(1) = 1 + 1 # last factor is the reversed chain
# z(2) = 1 + 2 + 3
# z(3) = 1 + 3 + 6 + 10
# z(4) = 1 + 4 + (4+3+2+1) + ((4+3+2+1)+(3+2+1)+(2+1)+(1))
# z(4) = 1 + 4 + 10 + (10+6+3+1)
# z(4) = 1 + 4 + 10 + 20 + 35
z(n) = binomial(2n,n)
z(20)