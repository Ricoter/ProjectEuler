using Combinatorics, BenchmarkTools

# unique square numbers below 100 (9's replaced by 6's)
global NUMS = [(0, 1), (0, 4), (0, 6), (1,6), (2, 5), (3, 6), (6, 4), (8, 1)]

function check(dice1, dice2)
    """
        Checks if the dices can make all NUMS
        Returns 1 if possible else 0
    """
    # keep track of possible NUMS
    checklist = zeros(8)

    # loop over all combinations of the given dices
    for n1 in dice1, n2 in dice2
        if (n1, n2) in NUMS
            checklist[findfirst(x->x==(n1, n2), NUMS)] = 1
        elseif (n2, n1) in NUMS
            checklist[findfirst(x->x==(n2, n1), NUMS)] = 1
        end
    end

    # return 1 if all nums can be made else 0
    return sum(checklist) == 8
end

function solve()
    # generate all possible dices (9's replaced by 6's)
    possibleDices = collect(combinations([0,1,2,3,4,5,6,7,8,6], 6)) 
    l = length(possibleDices)

    # check all dice combinations
    sum([check(possibleDices[i], possibleDices[j]) for i ∈ 1:l for j ∈ i:l])
end

solve()