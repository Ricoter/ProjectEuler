setprecision(350) # arithmetic precision (in bits)

total = 0
@time for n=1:100
    x = √BigFloat(n)
    if ~isinteger(x)
        x = string(x)
        x = replace(x, "."=>"")
        x = x[1:100]
        x = parse(BigInt, x)
        x = digits(x)
        total += sum(x)
    end
end
total