# # const COINS = [200, 100, 50, 20, 10, 5, 2]

# function p1(total=200, coin=total)
#     combinations = 0
#     for n=0:total ÷ coin
#         combinations += coin == 2 ? 1 : p(total-n*coin, coin-1)
#     end
    
#     combinations
# end


# function p2(total=200, coin=total)
#     combinations = 0
#     for n=0:total ÷ coin
#         if coin == 3
#             combinations += floor(Int, total/2) + 1
#         elseif coin == 2
#             combinations += 1
#         else
#             combinations += p2(total-n*coin, coin-2)
#         end
#         # combinations += coin == 2 ? 1 : p(total-n*coin, coin-1)
#     end
    
#     combinations
# end

# p = p2
# for n=3:2000
#     pn = p(n)
#     println("$n: $pn")
#     if pn%1000000==0
#         print(n)
#         break
#     end
# end


# x = p.(5:100)

function partition_function(N)
    """
        Partition function from wikipedia
    """
    p = BigInt.(zeros(N+1))
    p[1] = 1
    
    for n ∈ 1:N
        sign = 1
        a, b = 1, 1
        x = 0

        # Altering loop
        while true
            # take step a
            x += a
            x > n && break
            a += 2
            p[n+1] += sign*p[n+1-x]

            # take step b
            x += b
            x > n && break
            b += 1
            p[n+1] += sign*p[n+1-x]

            # update sign
            sign *= -1

        end
        p[n+1]%1000000 == 0 && return n

    end
    return p[N+1]
end

@time partition_function(60000)