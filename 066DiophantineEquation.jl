#= 
Problem 66 https://projecteuler.net/problem=66

Consider quadratic Diophantine equations of the form:

x^2 – Dy^2 = 1

For example, when D=13, the minimal solution in x is 6492 – 13×1802 = 1.

It can be assumed that there are no solutions in positive integers when D is square.

By finding minimal solutions in x for D = {2, 3, 5, 6, 7}, we obtain the following:

3^2 – 2×2^2 = 1
2^2 – 3×1^2 = 1
9^2 – 5×4^2 = 1
5^2 – 6×2^2 = 1
8^2 – 7×3^2 = 1

Hence, by considering minimal solutions in x for D ≤ 7, the largest x is obtained when D=5.

Find the value of D ≤ 1000 in minimal solutions of x for which the largest value of x is obtained.
=#

using BenchmarkTools
# This time I followed the Duck: https://en.wikipedia.org/wiki/Pell%27s_equation
# Convergents of √D are pairs of x/y that lead to integer solutions. So only those need to be checked


function x1y1(N)
    """
    Finds fundamental solution to Pell's equation using continued fractals 
    from P64. 

    Again just as in P64:

    (√N - _b)/_c
    ---> (√N + _b)/c, c = (N - _b^2 )/_c
    ---> a = (floor(√N) + _b) ÷ c
    ---> b = _b - a*c

    Note: only integers are used because otherwise floatingpoint errors arise.
    """
    n = floor(Int, √N)

    # initialize numerator
    h_curr = BigInt(1)
    h_prev = 0
    
    # initialize denominator
    k_curr = BigInt(0)
    k_prev = 1

    # initialize fractions for a
    a = n
    b = 0 
    c = 1

    for _ = 1:1000
        # update numerator
        h_next = a*h_curr + h_prev
        h_prev = h_curr
        h_curr = h_next

        # update denominator
        k_next = a*k_curr + k_prev
        k_prev = k_curr
        k_curr = k_next

        # update a
        b = -b - a*c
        c = (N - b^2)/c
        a = (n - b) ÷ c

        # Return "x" if Pell's equation is satisfied
        h_curr^2-N*k_curr^2==1 && return BigInt(h_curr), BigInt(k_curr), N
    end
end

# get all nonsquared numbers
D = [d for d=2:1000 if ~isinteger(√d)]

# find max value
x, y, D = maximum(x1y1.(D))

# print ans
println("$x^2 - $D*$y^2 = $(x^2-D*y^2)")