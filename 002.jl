# First solution
prev, new = [1, 2], 3
evenSum = 2
while new < 4e6
    prev[1] = prev[2]
    prev[2] = new
    new = sum(prev)
    if new%2==0
        evenSum += new
    end
end
evenSum

# Second solution
fibo = [1,2]
while fibo[end] < 4e6
    push!(fibo, sum(fibo[end-1:end]))
end
sum(fibo[fibo .% 2 .== 0])