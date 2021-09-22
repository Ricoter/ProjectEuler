function distance(x, y)
    a = y[1] - x[1]
    b = y[2] - x[2]
    c = a^2 + b^2
    return c
end

N = 50
x0 = (0, 0)
triangles = Set()
for i1 = 0:N, j1 = 0:N, i2 = 0:N, j2=0:N
    x1 = (i1, j1)
    x2 = (i2, j2)
    a = Set([x0, x1, x2])
    # println(a)
    a = length(a)
    # # println(a)
    a < 3 && continue
    d = [distance(x1, x0), distance(x1, x2), distance(x2, x0)]
    sort!(d)
    if d[1] + d[2] == d[3]
        counter += 1
        push!(triangles, sort!([x1, x2]))
    end
end
triangles