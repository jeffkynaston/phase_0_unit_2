# U2.W4: Numbers to Commas Solo Challenge

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  


# 1. Pseudocode

# What is the input?
# => The input is an integer value of unknown value
# => From the driver tests, we can tell that the input is a random 
#    number from 0 to 999999999
# What is the output? (i.e. What should the code return?)
# => The output is the same integer value with correct comma placement 
# => This output should be returned as a string, as ruby does not 
#    support integer values with commas. 
# What are the steps needed to solve the problem?
# 1) Define a method called separate_comma that takes one argument, (integer) 
# 2) Change this integer to a a string using to_s and store it in a variable, integer_string
# 3) Since we know that we know that we only have to account for 9 digits, an 
#    if statement would work nicely here. There are probably trickier ways to do it, but 
#    I can explore those after I get a working solution down.
# 4) As the first condition, check to see if the length of integer_string is <= 3
# 5) If so, return integer_string
# 6) elsif, check to see if the length is <= 6
# 7) If so, use the built-in ruby string method 'insert' to place a comma in the 
#    string after the third digit, return string
# 8) else, use the insert method to place a comma in the string after the 6th digit, return string


# 2. Initial Solution




# 3. Refactored Solution



# 4. Reflection 