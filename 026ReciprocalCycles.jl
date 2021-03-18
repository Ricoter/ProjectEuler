#= Repeating decimal

A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:

    1/2	= 	0.5
    1/3	= 	0.(3)
    1/4	= 	0.25
    1/5	= 	0.2
    1/6	= 	0.1(6)
    1/7	= 	0.(142857)
    1/8	= 	0.125
    1/9	= 	0.(1)
    1/10	= 	0.1 

Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.

Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.
=#


# function recurringCycle(n, a=5, b=1000)
#     for β = (a+1):b
#         (1//n*BigInt(10)^β)%1 == ((1//n * BigInt(10)^a) %1) && return β-a
#     end
# end
# @time argmax(recurringCycle.(1:100))

longest = 0
N = nothing

@time for n = 1:1000
    for β = 6:1000
        if (1//n*BigInt(10)^β)%1 == ((1//n * BigInt(10)^5) %1) 
            if longest < β
                longest = β
                N = n
            end
            break
        end
    end
end
println("$N: $longest")