
#=
Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, 
begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value 
    by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 
938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

What is the total of all the name scores in the file?
=#

nameScore(name::String) = sum(collect(name) - 'A' + 1)
function a()
    x = readlines("input/022Names.txt")[1]
    x = split(x, ",")
    x = strip.(x, '\"')
    x = sort(x)
    x = nameScore.(x)
    x .*= 1:length(x)
    sum(x)
end
@time a()