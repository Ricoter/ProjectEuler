#=
Powerful digit counts

The 5-digit number, 16807=7^5, is also a fifth power. Similarly, 
the 9-digit number, 134217728=8^9, is a ninth power.

How many n-digit positive integers exist which are also an nth power?
=#

sum([1 for p=1:21, i=big(1):9 if ndigits(i^p) == p])
#=
1: 9
2: 6
3: 5
4: 4
5: 3
6: 3
7: 2

10: 2
11: 1
21: 1
=#