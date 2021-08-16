#=
https://projecteuler.net/problem=65
=#



function ConvergentOfE(n)
    """ 
        e = [2; 1 2 1 1 4 1 1 6 1 ... 1 2k 1 ...]
        so the nth convergent is:
            n-1 to skip the first number 2
            then it comes in pairs of 3 numbers 1 2k 1
            so k = (n-1)/3
    """

    # create the sequence
    seq = []
    for i=2:n
        i%3==0 ? push!(seq, 2(i÷3)) : push!(seq, 1)
    end
    reverse!(seq)

    # compute the continued fractions
    a = big(seq[1])
    for b in seq[2:end]
        a = 1//(b+a)
        println(a)
    end

    # add the first number which is 2 for e
    return a+2
end

# get the numerator of the 100th convergent of e
x = ConvergentOfE(100).num

# get the sum of the digits
sum(digits(x))

 