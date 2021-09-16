using Primes

N = Int(5e7) - 1

primesA = reverse(primes(floor(Int, N ^ 1/2)))
primesB = reverse(primes(floor(Int, N ^ 1/3)))
primesC = reverse(primes(floor(Int, (N - 2^2 - 2^3) ^ 1/4)))

for c in primesC
    residual = N - c^4
    residual <= 0 && continue
    for b in primesB

    end
end
