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

function adj((x,y), N)
    """
        Returns the adjacent coordinates
    """
    1>x>N || 1>y>N && error("(x,y) out of bounds")

    # get all adjacent coordinates
    adj = [(x-1, y), (x+1, y), (x, y-1), (x,y+1)]

    # return only coordinates in the grid
    return [c for c in adj if 0∉c && N+1∉c]
end

function ShortestPath(M, source=(1,1), target=size(M))
    """
        Find the shortest path from (1,1) to (N,N)
        Only steps that increase the x or y are allowed
    """
    N = size(M,1) # size of dimension

    used = Set()        # used/visited positions
    ready = [source]    # already reached positions

    while true
        # continue at the shortest distance
        sort!(ready, by = x -> M[x...])
        current = popfirst!(ready)
        print(current)

        # consider all adjacent neighbours
        for position in adj(current, N)

            # only consider unused
            position ∈ used || position ∈ ready && continue

            # add tentative distance for new position
            M[position...] += M[current...]

            # return the distance to target position
            position==target && return M[position...]
            
            # add new position to "ready"-list
            push!(ready, position)
        end

        # add current to used/visited grid positions
        push!(used, current)
    end
end
ShortestPath(M)
