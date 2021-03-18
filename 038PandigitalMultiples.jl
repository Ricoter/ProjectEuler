#=
Take the number 192 and multiply it by each of 1, 2, and 3:

192 × 1 = 192
192 × 2 = 384
192 × 3 = 576

By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)

The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).

What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?
=#

"""
I couldn't sleep so I solved this one in bed with my eyes closed.

- The number  should obviously start with  as , and we want the 9 in front
- Also, all other multiplication will gain a digit as 
- So how many digits should  be? 
    1 ->  already used for the example 
    2 ->  provides  digits, cannot be concatenated to 9-digits
    3 ->  provides  digits, cannot be concatenated to 9-digits
    4 ->  provides  digits, 
    5 ->  provides  digits, too large
    

So  should be a 4-digit number that starts with 9 and 
    
    

Now the problem is suddenly not so hard anymore, just find the largest possible 
The second digit:
  - should be less then 5 as , that's a 9 too much
  - but also 4 provides an 8 or 9 too much. 
  - 3 works! 

 Now it's more about to find an arrangement that fits with numbers 2,4,5 (6|7)..
  - you can see that 2*2=4 and 2*7=.4, but also 5 can only be made with 2*2+1
  - at this point I picked my phone and used the basic calculator to make a few educated guesses because I'm not so good with numbers

after 3 tries I found 9327 * 2 = 18654
"""