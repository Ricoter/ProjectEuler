function splitnumber(n)
    d1 = n ÷ 1000
    d2 = (n - 1000d1) ÷ 100
    d3 = (n - 1000d1 -100d2) ÷ 10
    d4 = n - 1000d1 - 100d2 - 10d3
    return d1, d2, d3, d4
end
