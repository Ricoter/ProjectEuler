using Primes

function power2(k)
    n = 0
    while (k+n)>2^n
        n += 1
    end
    a = 2^n # multiplication
    b = k*n # addition
    return a, b
end

function prodSum(k, factors)
    a = prod(factors)
    b = sum(factors) + k - length(factors)
    return a, b
end

# k = 2
minProdSum = Set()
for k=2:12
    # upperbound: 1...|2|k is a general solution
    upperbound = 2k

    # find best power of 2: this is the minimal addition possible
    a, b = power2(k)

    # perfect solution
    if a == b
        push!(minProdSum, a)
        continue
    end

    while true
        if b >= upperbound
            push!(minProdSum, upperbound)
            break
        end
    
        # factor b
        factors = factor(Vector, b)

        # Check factors??? no strategy yet
        a, b = prodSum(k, factors)
        if a == b
            push!(minProdSum, a)
            continue
        end 


        b+=1
    end
end
sum(minProdSum)
    