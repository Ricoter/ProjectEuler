#=
Permuted multiples

It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.

Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.
=#

function p(order=6)
    for n in 10^(order-1):(10^order)÷6
        length(Set(digits(n))) < order && continue
        length(Set(sort.(digits.(n .* (1:6))))) == 1 && return n
    end
    return p(order+1)
end

@time p()

# [n for n in 10^5:10^6 if length(Set(sort.(digits.(n .* (1:6))))) == 1]
