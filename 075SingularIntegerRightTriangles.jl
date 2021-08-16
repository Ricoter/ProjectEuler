# Euclid's formula: https://en.wikipedia.org/wiki/Pythagorean_triple

function gcd(a, b)
    while a>0
        c = b % a
        b = a
        a = c
    end
    return b
end

MaxL = 15e5
counter = zeros(Int(MaxL))
MaxN = √(MaxL÷2)

@time for n=1:MaxN, m=(n+1):MaxN
    # only coprimes
    gcd(n, m) != 1 && continue

    # total length based on Euclid's method
    L = 2*m*(m+n)

    # skip both odd's
    n%2+m%2==2 && continue

    for k=1:MaxL÷L
        counter[Int(L*k)] += 1
    end
end

sum(counter .== 1)