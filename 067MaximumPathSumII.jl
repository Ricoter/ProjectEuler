#=
Maximum path sum II: https://projecteuler.net/problem=67

By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

3
7 4
2 4 6
8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom in triangle.txt (right click and 'Save Link/Target As...'), a 15K text file containing a triangle with one-hundred rows.

NOTE: This is a much more difficult version of Problem 18. It is not possible to try every route to solve this problem, as there are 299 altogether! If you could check one trillion (1012) routes every second it would take over twenty billion years to check them all. There is an efficient algorithm to solve it. ;o)
=#
using BenchmarkTools

# read data
data = readlines("input/067Triangle.txt")
L = length(data)

# fill the grid
T = zeros(Int, L, L)
for (i, line) in enumerate(data), (j, x) in enumerate(split(line))
    T[i,j] = parse(Int, x)
end

function Solve(T)
    for i=L:-1:2
        # Max lower value is added to number above
        T[i-1,:] += max.(T[i,:], circshift(T[i,:],-1))
    end
    T[1,1]
end

@benchmark Solve(T)

