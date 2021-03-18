#=

If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p ≤ 1000, is the number of solutions maximised?
=#

solutions = Dict(x=>0 for x=1:1000)

@time for a=1:500, b=a:500
    c = sqrt(a^2+b^2)
    p = a+b+c
    if isinteger(p) && p ∈ keys(solutions)
        solutions[p] += 1
    end
end

findmax(solutions)
