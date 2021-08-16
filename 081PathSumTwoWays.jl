using Plots: push!
# txt to Matrix{Int64}
M = readlines("input/081matrix.txt")
M = split.(M, ",")
M = hcat(M...)
M = parse.(Int, M)

# test input
M = [131 673 234 103  18; 
     201  96 342 965 150; 
     630 803 746 422 111; 
     537 699 497 121 956;
     805 732 524  37 331]

# show minimal neighbors
using Plots
heatmap(M)

function dive(A, s=size(A, 1))
    B = copy(A)
    for i=1:s, j=1:s
        prev, next = [], []
        i!=1 && push!(prev, A[i-1, j])
        j!=1 && push!(prev, A[i, j-1])
        i!=s && push!(next, A[i+1, j])
        j!=s && push!(next, A[i, j+1])
    
        j+i != 2 && (B[i,j] += minimum(prev))
        j+i != 2s && (B[i,j] += minimum(next))
    end
    return B
end
D = dive(M)
for _=1:2
    D = dive(D)
end
minimum(D)

# D1 = dive(M)
# D2 = dive(D1)
# D3 = dive(D2)
# D4 = dive(D3)
# D5 = dive(D4)
# heatmap(D1)

# i, j = 1, 1
# total = M[i,j]
# path = copy(M)
# for _=1:158
#     if j==80
#         i+=1
#     elseif i==80
#         j+=1
#     else
#         r = D1[i+1, j]
#         d = D1[i, j+1]

#         if r<d && i<80
#             i += 1
#         elseif d<r && j<80
#             j += 1
#         elseif r==d
#             println("sama-sama")
#         end
#     end
#     path[i,j] = -100
#     total += M[i,j]
# end
# println("$i, $j, $total")

# heatmap(path)