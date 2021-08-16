data = readlines("input/079Keylog.txt")
data = digits.(parse.(Int, data))

code = []
for l in data, i in 1:3
    if l[i] ∈ code
        
