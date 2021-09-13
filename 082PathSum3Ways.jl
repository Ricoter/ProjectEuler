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

function adj((x,y), N)
    """
        Returns the up, down and right coordinates
    """
    1>x>N || 1>y>N && error("(x,y) out of bounds")

    # get all adjacent coordinates (without backwards)
    adjacents = [(x-1, y), (x+1, y), (x,y+1)]

    # return only coordinates in the grid
    return [c for c in adjacents if 0∉c && N+1∉c]
end

function ShortestPath(M)
    """
        Find the shortest path from left to right
        Only moving up, down and right
    """
    N = size(M,1)               # size of square grid
    source = [(x,1) for x=1:N]  # first column
    used = Set()                # used/visited positions
    counter = N                 # filled last column values

    while true
        # continue at the current shortest distance
        sort!(source, by = x -> M[x...])
        current = popfirst!(source)

        # consider up/down/right "adjacent" neighbours
        for position in adj(current, N)

            # only consider unused
            (position ∈ used || position ∈ source) && continue

            # add tentative distance for new position
            M[position...] += M[current...]

            # return minimum when last column is filled
            counter -= (position[2]==N) # if true subtract 1
            counter==0 && return minimum(M[:,N])

            # add new position to "ready"-list
            push!(source, position)
        end

        # add current to used/visited grid positions
        push!(used, current)

    end
end

ShortestPath(M)