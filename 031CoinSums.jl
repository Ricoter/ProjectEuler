#=
In the United Kingdom the currency is made up of pound (£) and pence (p). There are eight coins in general circulation:

    1p, 2p, 5p, 10p, 20p, 50p, £1 (100p), and £2 (200p).

It is possible to make £2 in the following way:

    1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p

How many different ways can £2 be made using any number of coins?
=#

# We don't need the last coin as it will always fill up the total amount left
const COINS = [200, 100, 50, 20, 10, 5, 2]

function coinRecursion(total=200, i=1)
    combinations = 0
    coin = COINS[i]
    for n=0:total ÷ coin
        combinations += coin == 2 ? 1 : coinRecursion(total-n*coin, i+1)
    end
    
    combinations
end
@time coinRecursion(2000)