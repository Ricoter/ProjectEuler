using Plots: push!
# txt to Matrix{Int64}
M = readlines("input/081matrix.txt")
M = split.(M, ",")
M = hcat(M...)
M = parse.(Int, M)

# test input
# M = [131 673 234 103  18; 
#      201  96 342 965 150; 
#      630 803 746 422 111; 
#      537 699 497 121 956;
#      805 732 524  37 331]

# show minimal neighbors
using Plots
heatmap(M)

function ShortestPath(M)
    """
        Find the shortest path from (1,1) to (N,N)
        Only steps that increase the x or y are allowed

        Technique: devide square in two triangles and work from the diagonal to the corners by adding the minimal previous step.
        Same as problem 
    """
    # loop over diagonal lines from (1,1) to (N,N)
    N = size(M, 1)

    # first half
    for n=2:N, i=0:n-1
        x, y = n-i, 1+i # diagonal x,y coordinates
        if x==1
            M[x,y] += M[x,y-1]
        elseif y==1
            M[x,y] += M[x-1,y]
        else
            M[x,y] += min(M[x-1,y], M[x,y-1])
        end
    end

    # second half
    for n=2:N, i=0:N-n
        x, y = n+i, N-i # diagonal x,y coordinates
        M[x,y] += min(M[x-1,y], M[x,y-1])
    end
    return M[N,N]
end
ShortestPath(M)
