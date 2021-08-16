T = [
75  0  0  0  0  0  0  0  0  0  0  0  0  0  0; 
95 64  0  0  0  0  0  0  0  0  0  0  0  0  0;
17 47 82  0  0  0  0  0  0  0  0  0  0  0  0;
18 35 87 10  0  0  0  0  0  0  0  0  0  0  0;
20 04 82 47 65  0  0  0  0  0  0  0  0  0  0;
19 01 23 75 03 34  0  0  0  0  0  0  0  0  0;
88 02 77 73 07 63 67  0  0  0  0  0  0  0  0;
99 65 04 28 06 16 70 92  0  0  0  0  0  0  0;
41 41 26 56 83 40 80 70 33  0  0  0  0  0  0;
41 48 72 33 47 32 37 16 94 29  0  0  0  0  0;
53 71 44 65 25 43 91 52 97 51 14  0  0  0  0;
70 11 33 28 77 73 17 78 39 68 17 57  0  0  0;
91 71 52 38 17 14 91 43 58 50 27 29 48  0  0;
63 66 04 68 89 53 67 30 73 16 69 87 40 31  0;
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
]

nums = []
pos = 1
for i=1:size(T)[1]
    if T[i, pos] < T[i, pos+1]
        append!(nums, T[i, pos+1])
        pos += 1
    else
        append!(nums, T[i, pos])
    end
end
sum(nums)

hi = 1064

Tm = copy(T)    
for i=size(T)[1]:-1:2
    # Tm[i-1,:] += v1* max(T[i,:], circshift(T[i,:],-1))
    Tm[i-1,:] += max.(Tm[i,:], circshift(Tm[i,:],-1))
    # reverse 

    Tm[T .== 0] .= 0
end
Tm[1,1]
    # Tm *= T/100

# nums2 = []
# pos = 1
# for i=1:size(T)[1]
#     if Tm[i, pos] < Tm[i, pos+1]
#         append!(nums2, T[i, pos+1])
#         pos += 1
#     else
#         append!(nums2, T[i, pos])
#     end
# end
# # sum(nums), sum(nums2), nums2 
# if sum(nums2) > hi
#     hi = sum(nums2)
#     println("$hi: $v1 $v2 $v3")
# end


# 1064




### WARNING: BRUTE FORCE ###
# any possible route can be represented as a binary of 0s and 1s. 0=left 1=right
steps = 14 #(size-1)
hi = 0
@time for n=0:2^steps-1
    bits = parse.(Int,collect(bitstring(n)[end-14:end])) # convert number to bitarray
    tot, pos = 0, 1
    for j=1:15
        pos += bits[j]
        tot += T[j, pos]
    end
    hi = max(hi, tot)
end
hi