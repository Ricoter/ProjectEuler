# cut to all corners (all corner problem)
AC(n) = (n^2-3n)÷2 + 1 # ÷ because its numerator is always even and this keeps an integer

# cut to two corners and a straight line from one corner to other side (straight-line-corner problem)
# after the 3 cuts, one piece will be untouched -> m=n-3 
#-> this provides 0:m permutations -> m+1 = n-2 -> symmetryfactor = 6
SLcs(n) = 6(n-2) 

# straight line from side to side problem
SLss(n) = (n-4)%3==0 ? n-4 : 0

# efficient way for all SLss up to N
function sumSLss(N)
    """
    (N-1)÷(3+3)*3
    (N-1)÷(3+6)*6
    (N-1)÷(3+9)*9
    """
    tot=0
    for i=7:3:N
        tot += i-4
        tot %= 1000000007
    end

    # for i=1:(N-13)/3
    #     tot +=  
    #     tot %= 1000000007
    # end

    # for i = 0:((N-1)÷3)
    #     tot += (N-1) ÷ (3+3i) * 3i
    #     tot %= 1000000007
    # end
    return Int(tot)
end

SLss1(N) = (N-1)÷6 * 3 # 7 + 6m -> 3 (3 is the symmetry factor)
# SLss2(N) = (N-1)
# special families
# function 


psi(n) = AC(n) + SLcs(n) + SLss(n)
Psi(N, m=1000000007) = (sum(AC.(3:N)) + sum(SLcs.(3:N))) % m
PSI(N, m=1000000007) = Int( sum(AC.(3:N)) % m + sum(SLcs.(3:N)) % m + sumSLss(N) )  

Ksol = 172166601
Kbase = sum(AC.(3:1000)) +  sum(SLcs.(3:1000)) # 166167000 + 2991006 = 169158006
Kdiff = Ksol - Kbase # 3008595
Kdiff2 = Kdiff - sumSLss(1000) # 3008595 - 165834 = 2842761

#=
primes: Kdiff2  3 19 53 941
Kdiff is of the same order as SLcs with is 6(n-2)
=#
