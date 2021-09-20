n = 0

mapping = Dict(
    'I'=>1,
    'V'=>5,
    'X'=>10,
    'L'=>50,
    'C'=>100,
    'D'=>500,
    'M'=>1000
)

function toDecimal(romanstring)
    decimals  = [mapping[c] for c in romanstring]
    for i in 1:length(decimals)-1
        if decimals[i] < decimals[i+1]
            decimals[i+1] -= decimals[i]
            decimals[i] = 0
        end
    end
    return sum(decimals)
end

function toRoman(N)
    romanstring = []
    while N >= 1000
        push!(romanstring, 'M')
        N -= 1000
    end
    if N >= 900
        append!(romanstring, ['C', 'M'])
        N -= 900
    end
    if N >= 500
        push!(romanstring, 'D')
        N -= 500
    end
    if N >= 400
        append!(romanstring, ['C', 'D'])
        N -= 400
    end
    while N >= 100
        push!(romanstring, 'C')
        N -= 100
    end
    if N >= 90
        append!(romanstring, ['X', 'C'])
        N -= 90
    end
    if N >= 50
        push!(romanstring, 'L')
        N -= 50
    end
    if N >= 40
        append!(romanstring, ['X', 'L'])
        N -= 40
    end
    while N >= 10
        push!(romanstring, 'X')
        N -= 10
    end
    if N >= 9
        append!(romanstring, ['I', 'X'])
        N -= 9
    end
    if N >= 5
        push!(romanstring, 'V')
        N -= 5
    end
    if N >= 4
        append!(romanstring, ['I', 'V'])
        N -= 4
    end
    while N >= 1
        push!(romanstring, 'I')
        N -= 1
    end
    return romanstring
end

for line in readlines("input/089Roman.txt")
    dec = toDecimal(line)
    rom = toRoman(dec)
    n += length(line) - length(rom)
end
n