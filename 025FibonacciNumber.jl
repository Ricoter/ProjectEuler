function p25(n=1000)
    fibo = BigInt.([1,1])
    len = BigInt(10)^n
    while fibo[end] < len
        append!(fibo, sum(fibo[end-1:end]))
    end
    length(fibo)
end

@time p25()