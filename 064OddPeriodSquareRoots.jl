# https://projecteuler.net/problem=64
using BenchmarkTools

function OddPeriod(N)   # Keep it Rational
    """
    Sequence repeats when the fraction becomes the same
    n is the floored version √N

    (√N - _b)/_c
    ---> (√N + _b)/c, c = (N - _b^2 )/_c
    ---> a = (floor(√N) + _b) ÷ c
    ---> b = _b - a*c
    """
    println(N)
    isinteger(√N) && return 0
    n = floor(Int, √N) # These calculations don't need decimal points
    a = n
    b = 0 
    c = 1
    for period = 1:100000
        b = -b - a*c
        c = (N - b^2)/c  #(√N - a[end])(√N + a[end])/c_old
        a = (n - b) ÷ c
        println("$a $b $c")
        b == -n && c == 1 && return period%2
    end
end

# @benchmark sum(OddPeriod.(1:10000))
OddPeriod.(1:14)





  ##########################################################################################
#### FAILED TRY OUT, because of some floating point diversions?? works for the test input ####
  ##########################################################################################

# function RepetingSequenceLength(n)   # compare an 
#     "Sequence repeats when it meets 2*a0"
#     x = √n
#     isinteger(x) && return 0
#     seq = []
#     while true
#         _x = x % 1
#         _a = x - _x
#         push!(seq, _a)
#         x = 1/_x
#         if 2*seq[1] == _a
#             # d = 0
#             # # seq[1] == seq[2] && return length(seq)
#             # d = 0
#             # while true
#             #     _x = x % 1
#             #     _a = x - _x
#             #     _a != seq[end] && break
#             #     push!(seq, _a)
#             #     x = 1/_x
#             # end
#             return (length(seq)-1) % 2
#         end
#     end
# end

# function RepetingSequenceLength2(n) # floats of the number sequence
#     "Sequence repeats when it meets 2*a0"
#     x = √n
#     isinteger(x) && return 0

#     # first one
#     _x = x % 1
#     x = 1/_x
    
#     x1 = _x
#     println(x1)
#     cnt = 1
#     for _=1:10
#         _x = x % 1
#         x = 1/_x
#         println("$x1 $_x")
#         if x1 == _x  
#             return cnt % 2
#         end
#         cnt += 1 # dont add the same number
#     end
# end


# function RepetingSequenceLength3(n)   # compare multiple an 
#     "Sequence repeats when it meets 2*a0"
#     x = √n
#     isinteger(x) && return 0
#     seq = []
#     # println(n)
#     for _=1:10^8
#         _x = x % 1
#         _a = x - _x
#         push!(seq, Int(_a))
#         x = 1/_x
#         length(seq) < 15 && continue
#         if 2*seq[1] == seq[end-10]
#             # println(seq[1:50])
#             # println(seq[end-50:end])

#             seq[end-15:end-11] == seq[end-5:-1:end-9] && (length(seq)-1) %2
#         end
#     end
#     # println(seq[1:1000])
#     println("\n\t\t$n\n")
#     return 0
# end

# # @time sum(RepetingSequenceLength3.(2:10000))

# # sum(a .% 2)                1159

# # RepetingSequenceLength2(1159)
# # RepetingSequenceLength2(23)
# # x = RepetingSequenceLength4.(1:13); sum(x)