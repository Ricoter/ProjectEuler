
# First solution with vectorization
isMultiple(n, elements) = 0 ∈ (n .% elements)

n = 1:999
elements = 3, 5
sum(n[isMultiple.(n, [elements])])

# Second solution with array comprehension
sum([i for i=1:999 if 0 ∈ (i .% [3, 5])])
