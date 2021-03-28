#=
Poker hands

In the card game poker, a hand consists of five cards and are ranked,
from lowest to highest, in the following way:

    High Card: Highest value card.
    One Pair: Two cards of the same value.
    Two Pairs: Two different pairs.
    Three of a Kind: Three cards of the same value.
    Straight: All cards are consecutive values.
    Flush: All cards of the same suit.
    Full House: Three of a kind and a pair.
    Four of a Kind: Four cards of the same value.
    Straight Flush: All cards are consecutive values of same suit.
    Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.

The cards are valued in the order:
2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.

If two players have the same ranked hands then the rank made up of the
highest value wins; for example, a pair of eights beats a pair of fives
(see example 1 below). But if two ranks tie, for example, both players 
have a pair of queens, then highest cards in each hand are compared (see
example 4 below); if the highest cards tie then the next highest cards are 
compared, and so on.

Consider the following five hands dealt to two players:
Hand	 	Player 1	 	    Player 2	 	    Winner
1	 	5H 5C 6S 7S KD	 	 2C 3S 8S 8D TD         Player 2
         Pair of Fives        Pair of Eights      
2	 	5D 8C 9S JS AC       2C 5C 7D 8S QH         Player 1
         Highest card Ace     Highest card Queen
3	 	2D 9C AS AH AC       3D 6D 7D TD QD	 	    Player 2
         Three Aces           Flush with Diamonds
4	 	4D 6S 9H QH QC	 	 3D 6D 7H QD QS        	Player 1
         Pair of Queens       Pair of Queens
         Highest card Nine    Highest card Seven
5	 	2H 2D 4C 4D 4S    	 3C 3D 3S 9S 9D        	Player 1
         Full House           Full House
         With Three Fours     with Three Threes

The file, poker.txt, contains one-thousand random hands dealt to two players.
Each line of the file contains ten cards (separated by a single space): the first
five are Player 1's cards and the last five are Player 2's cards. You can assume
that all hands are valid (no invalid characters or repeated cards), each player's
hand is in no specific order, and in each hand there is a clear winner.

How many hands does Player 1 win?
=#

cardvalue = Dict(x => i for (i, x) in enumerate("23456789TJQKA")) 
CardValue(hand) = [cardvalue[x] for x in hand[1]] # :Array of cardvalues

function Similar(hand)
    "Returns occurences of every card in a Dict"
    d = Dict()
    for x in hand
        if x ∈ keys(d)
            d[x] += 1
        else
            d[x] = 1
        end
    end
    return d
end

# Similar(hand) = Dict(k=>count(x->x==k,hand[1]) for k in unique(hand[1]))


function HighPair(hand)
    "Returns the cardvalues for each pair, starting for the best value for the largest pair" 
    pairDict = Similar(hand[1])
    pairs = sort(collect(Set(values(pairDict))))
    vals = []
    for i in pairs[end:-1:1]
        _vals = sort([cardvalue[k] for (k,v) in pairDict if v==i], rev=true)
        append!(vals, _vals)
    end
    return vals
end

function HighCard(p1, p2)
    "Returns the winner based on highest pair/card"
    rank1 = HighPair(p1)
    rank2 = HighPair(p2)
    for i=1:length(rank1)
        rank1[i] == rank2[i] && continue
        rank1[i] > rank2[i] && return 1 # player 1 wins
        rank1[i] < rank2[i] && return 0 # player 2 wins
    end
    return nothing # no winner
end

Pairs(hand) = values(Similar(hand[1])) # :Array of occurences without card rank

# These are the possible combinations that contribute to Rankings
# The check fn starts at the best ranking and breaks when a winner is found
# This means the bigger pairs are checked first and these functions do NOT check
# again for other pairs at lower ranking. So OnePair already knows it is not a 
# TwoPair of FullHouse. Just as a Flush is not a StraightFlush. 
# All return Boolean values
OnePair(hand) = 2 ∈ Pairs(hand)
TwoPairs(hand) = sort(collect((Pairs(hand)))) == [1,2,2]
ThreeOfAKind(hand) = 3 ∈ Pairs(hand)
Straight(hand) = length(Set(CardValue(hand)))==5 && maximum(CardValue(hand))-minimum(CardValue(hand))==4
Flush(hand) = length(Set(hand[2])) == 1
FullHouse(hand) = 3 ∈ Pairs(hand) && 2 ∈ Pairs(hand)
FourOfAkind(hand) = 4 ∈ Pairs(hand)
StraightFlush(hand) = Straight(hand) && Flush(hand)
RoyalFlush(hand) = Set(hand[1]) == Set("TJQKA") && Flush(hand)

# All ranking functions
Rankings = [RoyalFlush, StraightFlush, FourOfAkind, FullHouse, Flush, Straight, ThreeOfAKind, TwoPairs, OnePair]

function check(hands)
    "returns 1 of player 1 wins, else 0"
    p1, p2 = hands
    for f in Rankings
        f(p1) && f(p2) && break
        f(p1) && return 1
        f(p2) && return 0
    end
    return HighCard(p1, p2)
end

testdata = [
    ["5H", "5C", "6S", "7S", "KD", "2C", "3S", "8S", "8D", "TD"],
    ["5D", "8C", "9S", "JS", "AC", "2C", "5C", "7D", "8S", "QH"],
    ["2D", "9C", "AS", "AH", "AC", "3D", "6D", "7D", "TD", "QD"],
    ["4D", "6S", "9H", "QH", "QC", "3D", "6D", "7H", "QD", "QS"],
    ["2H", "2D", "4C", "4D", "4S", "3C", "3D", "3S", "9S", "9D"]
]

function main()
    data = readlines("input/054Poker.txt")
    data = split.(data)
    # data = testdata
    score = 0
    for x in data
        vals, suit = getindex.(x, 1), getindex.(x, 2)
        hands = [[vals[1:5], suit[1:5]], [vals[6:10], suit[6:10]]]
        score += check(hands)
    end
    return score
end

main()