board = zeros(40)

position = 0    # starting position
sidesOfDice = 6 # sides of dice

nextR = Dict(7=>15, 22=>25, 36=>5)
nextU = Dict(7=>12, 22=>28, 36=>12)
back3 = Dict(7=>4, 22=>19, 36=>33)

function Chance(position)
    """
        Chance cards are at square 7, 22 and 36
    """
    cards = [
        40,                 # Advance to GO
        10,                 # Go to JAIL 
        11,                 # Go to C1
        24,                 # Go to E3
        39,                 # Go to H2
        5,                  # Go to R1
        nextR[position],    # Go to next R
        nextR[position],    # Go to next R
        nextU[position],    # Go to next u
        back3[position],    # Go back 3 squares
    ]

    if rand() > 10//16 
        return position
    else
        return cards[rand(1:10)]
    end
end

function CommunityChest(position)
    return rand() > 2//16 ? position : rand((10,40))
end

doubles = 0
for _=1:10000000
    # roll dices
    dices = rand((1:sidesOfDice), 2)
    score = sum(dices)

    # check for 3 doubles in a row
    isequal(dices...) ? (doubles += 1) : (doubles = 0)
    if doubles == 3
        position = 10 # go to jail
        doubles = 0
    else
        position = mod1(position+score+40, 40) # walk
    end

    # check CC, CH and G2J
    if position == 30 # G2J
        position = 10
        doubles = 0
    end

    if position ∈ [7, 22, 36] # CH
        position = Chance(position) # note that 3 steps back can land on a CC square
        position == 10 && (doubles = 0)
    end
    
    if position ∈ [2, 17, 33] # CC
        position = CommunityChest(position)
        position == 10 && (doubles = 0)
    end

    # save final position
    board[position] += 1

    # repeat
end

board ./= sum(board)
mostVisited = sort(board)[end:-1:end-2]
for x in mostVisited
    x = findfirst(isequal(x), board)
    x %= 40
    print(lpad(x,2,"0"))
end
println()
println(mostVisited)