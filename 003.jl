#=
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
=#

function largestPrime(n::Int)
    """Return largest prime factor for a natural number."""
    f = 2
    while n%f == 0
        n /= f
    end

    f += 1 
    while n > 1
        n%f==0 ? n÷=f : f+=2
    end
    return f
end


z(n,f=2) = n==1 ? f : (n%f==0 ? z(n÷f,f) : z(n,f+1))
@time z(600851475143)
@time largestPrime(600851475143)
