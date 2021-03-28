#=
Starting with 1 and spiralling anticlockwise in the following way, a square spiral with side length 7 is formed.

37 36 35 34 33 32 31
38 17 16 15 14 13 30
39 18  5  4  3 12 29
40 19  6  1  2 11 28
41 20  7  8  9 10 27
42 21 22 23 24 25 26
43 44 45 46 47 48 49

It is interesting to note that the odd squares lie along the bottom right diagonal, but what is more interesting
is that 8 out of the 13 numbers lying along both diagonals are prime; that is, a ratio of 8/13 ≈ 62%.

If one complete new layer is wrapped around the spiral above, a square spiral with side length 9 will be formed.
If this process is continued, what is the side length of the square spiral for which the ratio of primes along 
both diagonals first falls below 10%?
=#

using Primes

nprimes = 0; x = 1
for dx=2:2:10^6, _ = 1:4
    x += dx
    isprime(x) && (nprimes+=1)
    10nprimes < 2dx+1 && dx > 8 && (println(dx+1); break)
end

currentnumber=1 # Current number
stepsize=0      # Stepsize to next diagonal number
total=1         # Total number of diagonals
nPrimes=0       # Number of primes on the diagonal
while true
    stepsize += 2                   # add 2 to the stepsize
    for _=1:4                       # 4 steps represent 4 corners
        currentnumber += stepsize   # add the current stepsize to go to next corner
        if isprime(currentnumber)   # count the number of primes
            nPrimes += 1
        end
    end
    total += 4  # total increases 4

    if stepsize > 8 && 10nPrimes < total  # starts at 9x9 spiral & check for 10% primes
        sidelength = stepsize + 1
        print(sidelength)
        break
    end
end