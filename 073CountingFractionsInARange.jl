function gcd(a, b)
    while a>0
        c = b % a
        b = a
        a = c
    end
    return b
end

function solve(total = -2) # does not include 1/3 and 1/2
    for d in 2:12000, n=ceil(Int, d/3):floor(Int, d/2)
        gcd(d, n) == 1 && (total+= 1)
    end
    print(total)
end 
    
@time solve()