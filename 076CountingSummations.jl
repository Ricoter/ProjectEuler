
global total = 0

function roll(N, summation, prevHeight)
    heightLimit = min(N-summation, prevHeight)
    # summation += prevHeight

    for h in heightLimit:-1:2
        # print(h)
        # summation+h==N && (global total+=1)
        roll(N, summation+h, h)
        # if summation + h == N
        #     # println("|")
        #     global total += 1
        # elseif h == 1
        #     global total += 1
        #     # println("")
        # else
        #     roll(N, summation+h, h)
        # end
    end
    global total += 1
end

using BenchmarkTools
@time roll(100, 0, 99)

total
