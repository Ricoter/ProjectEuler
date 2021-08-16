using Primes

function roll(N, summation, prevHeight)
    heightLimit = min(N-summation, prevHeight)

    count = 0
    if heightLimit > 0
        for h in reverse(primes(heightLimit))
            count += roll(N, summation+h, h)
        end
    end
    return summation==N ? count+1 : count
end

@time for n=10:100
    if roll(n, 0, n-1) > 5000 
        println(n)
        break
    end
end

