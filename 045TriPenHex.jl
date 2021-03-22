using BenchmarkTools

T(n) = n*(n+1)/2
# P(n) = n*(3n-1)/2

isP(x) = isinteger((√(24x+1)+1)/6)
isH(x) = isinteger((√(8x+1)+1)/4)

function next(n = 286)   
    while true
        t = T(n)
        isH(t) && isP(t) && return t
        n += 1
    end 
end

@benchmark next()