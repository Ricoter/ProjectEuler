C(n, r) = factorial(n)÷(factorial(r)*factorial(n-r))


function main()
    c = 0
    for n=BigInt(23):100
        for r=1:n
            if C(n,r) > 10^6 
                c += n+1 - 2r
                break
            end
        end
    end
    return c
end

@time main()

