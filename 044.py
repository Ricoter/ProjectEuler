def P(n): 
    return n*(3*n-1)/2

def N(p):
    return ((24*p+1)**0.5+1)/6 # inverse

def main():
    for i in range(2, 10000):
        for j in range(1, i):
            a, b = P(i), P(j)
            if N(a+b).is_integer() & N(a-b).is_integer():
                print(a-b)
                return

main()