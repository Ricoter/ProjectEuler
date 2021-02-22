#=
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
=#

# The faster solution is just by inspection, 
# delete all numbers between 1:19 that can be constructed by others, 
# 18, 16, 15, 14, 12, 10... leave 8, 8 is used to construct 16..., 6(needed for 12),... 4 (already in 8), 3 (already in 9), 2 (needed for 16)
# than remove all factors that are an element of those left (like 4 that is in 8 that needed to stay for 16)
# then you are left with 2*5*7*8*9*11*13*17*19=232792560

function bruteforce()
    i = 1
    r = collect(10:19)
    while true
        sum(i .% r)==0 && break
        i += 1
    end
    return i
end
bruteforce()