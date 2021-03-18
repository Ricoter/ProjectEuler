#=

145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: As 1! = 1 and 2! = 2 are not sums they are not included.
=#
∑ = 0
@time for n=3:Int(5e4)
    digits = parse.(Int, collect(string(n)))
    sum(factorial.(digits)) == n && (∑ += n)
end
∑