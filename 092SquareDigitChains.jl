N = 10000000
counter = 0

to1 = Set(1)
to89 = Set(89)
for n = 2:N
    _nums = Set(n)

    while true
        if n ∈ to89
            counter += 1
            push!(to89, _nums...)
            break
        elseif n ∈ to1
            push!(to1, _nums...)
            break
        else
            n = sum(digits(n) .^ 2)
            push!(_nums, n) 
        end
    end
end
counter