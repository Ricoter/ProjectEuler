seq(n) = n * (n + 1) ÷ 2 # 1 + 2 ... n-1 + n

best, area = target, 0

for n=1:100
    for m=n:100
        🟪 = seq(n) * seq(m) # number of rectangles
        δ = 2e6 - 🟪
        if abs(δ) < best
            best = abs(δ)
            area = m*n
        end
        δ < 0 && break
    end
end

print(area)