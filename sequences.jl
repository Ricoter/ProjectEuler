seq(n) = n*(n+1)÷2 # 1 + 2 + ... + n-1 + n

function sequenceDividerFinder(N, start=2, finish=1000)
    """Returns list of sequences seq(n) that are a factor of N"""
    hits = []
    for n = start:finish 
        N%seq(n)==0 && append!(hits, n)
    end
    return hits
end


# Ns = []
# for i=0:50
#     hits = sequenceDividerFinder(N-i, start=10, finish=1000)
#     length(hits)>0 