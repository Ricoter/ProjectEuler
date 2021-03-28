using BenchmarkTools

sumsquares1(N) = sum(1:N)^2 - sum((1:N).^2)

function sumsquares(N=100)
    sum = N * (N + 1) / 2
    sumsq = (2 * N + 1) * (N + 1) * N / 6
    return sum^2 - sumsq
end

@benchmark sumsquares(1000000); @benchmark sumsquares1(1000000)