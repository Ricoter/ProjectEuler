using Combinatorics

OPS = (+, -, *, /)

bestNumber = 0
bestScore = 0
scores = []
for combination in combinations(0:9, 4)
    tracklist = zeros(6*7*8*9)
    for (a, b, c, d) in permutations(combination)
        for f in OPS, g in OPS, h in OPS
            target = f(g(h(a, b), c), d)
            isinteger(target) && (0 < target) && (tracklist[Int(target)]=1)
        end
    end
    score = findfirst(isequal(0), tracklist)
    println("->  $score")

    push!(scores, score)
    if score > bestScore
        bestScore = score
        a, b, c, d = combination
        bestNumber = 1000a + 100b + 10c + d
        println("-> $bestNumber: $bestScore")
    end
    if combination == [1,2,3,4]
        println(score)
    end
end
println("best Number: $bestNumber")



# tracklist = zeros(6*7*8*9)
# counter = 0
# for (a, b, c, d) in permutations([1,2,3,4])
#     for f in OPS, g in OPS, h in OPS
#         target = f(g(h(a, b), c), d)
#         isinteger(target) && target > 0 && (tracklist[Int(target)]=1)
#     end
# end
# score = findfirst(isequal(0), tracklist) - 1
# differentNums = sum(tracklist)


# println("score: $score")
# println("differentNums: $differentNums")
