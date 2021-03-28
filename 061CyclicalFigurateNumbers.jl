# https://projecteuler.net/new_post=61

P = Dict([
    (3, n -> n*(n+1)÷2),
    (4, n -> n^2),
    (5, n -> n*(3n-1)÷2),
    (6, n -> n*(2n-1)),
    (7, n -> n*(5n-3)÷2),
    (8, n -> n*(3n-2))
])

slice(n) = [n÷100, n%100]
unslice(a) = a[1]*100 + a[2]
sliced4digit(v, V=v.(1:1000)) = slice.(V[(1e3 .<= V .< 1e4)])
PArray = Dict([k => sliced4digit(v) for (k, v) in P])

function findtail(tail, unused)
    a, b = tail[begin][1], tail[end][2]
    unused==[] && a==b && print(sum(unslice.(tail)))

    for n in unused, (i, j) in PArray[n]
        if b == i
            _tail = [tail; [[i, j]]]
            _unused = filter(e -> e != n, unused)
            findtail(_tail, _unused)
        end
    end
end

[findtail([n], [3,4,5,6,7]) for n in PArray[8]];