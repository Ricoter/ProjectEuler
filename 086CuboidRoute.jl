## Brute force does not work for large M
# M = 99
# counter

# for a=1:M
#     for b=a:M, c=b:M
#         shortestpath = √((a+b)^2 + c^2)
#         isinteger(shortestpath) && (counter += 1)
#     end
# end


function squares(M)
    counter = 0
    for a=1:M
        for bc=2:2a
            if isinteger(√(a^2 + bc^2)) 
                counter += bc÷2
                bc >= a && (counter -= bc-a-1)
            end
        end

    end
    counter
end

function binarySearch(a=0, b=2000, target=1e6)
    
    while abs(b-a) > 1
        mid = (a+b)÷2
        squares(mid) < target ? (a = mid) : (b = mid)
    end
    return b
end

@time binarySearch()