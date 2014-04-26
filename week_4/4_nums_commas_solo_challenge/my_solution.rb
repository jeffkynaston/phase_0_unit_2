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
# 8) else, use the insert method to place a comma in the string after the 6th digit,
#    then chain one more insert method to place a comma after the 3rd digit, return string


# 2. Initial Solution

def separate_comma(integer)
	integer_string = integer.to_s
	if integer_string.length <= 3
		return integer_string
	elsif integer_string.length <= 6
		return integer_string.insert(-4,',')
	else
		return integer_string.insert(-7,',').insert(-4,',')
	end
end

# puts separate_comma(1)
# puts separate_comma(12)
# puts separate_comma(123)
# puts separate_comma(1234)
# puts separate_comma(12345)
# puts separate_comma(123456)
# puts separate_comma(1234567)
# puts separate_comma(12345678)
# puts separate_comma(123456789)



# 3. Refactored Solution

def separate_comma(integer)
	integer = integer.to_s
	if integer.length <= 3
		return integer
	elsif integer.length <= 6
		return integer.insert(-4,',')
	elsif integer.length <= 9
		return integer.insert(-7,',').insert(-4,',')
	else
		return integer.insert(-10,',').insert(-7,',').insert(-4,',')
	end
end

# puts separate_comma(1)
# puts separate_comma(12)
# puts separate_comma(123)
# puts separate_comma(1234)
# puts separate_comma(12345)
# puts separate_comma(123456)
# puts separate_comma(1234567)
# puts separate_comma(12345678)
# puts separate_comma(123456789)
# puts separate_comma(1234567891)
# puts separate_comma(12345678912)
# puts separate_comma(123456789123)



# 4. Reflection 

# For my refactored solution, I decided to get rid of my extra variable, 
# integer_string. When I am pseudocoding and thinking things out, it helps
# to split things out into more steps and use additional variables. Once 
# I am comfortable with the solution, it gets easier for me to visualize
# the algorithm without these extra steps. To get a little practice with Rspec,
# I updated my function to handle 3 more digits and created a driver
# code test to test for those additional numbers. If I had more time, I could 
# update the method to check for decimals as well. 

# I used an if/else statement to handle the logic behind the algorithm. 
# Although it is not the most scalable solution, it actually works for most
# practical applications. The method currently handles integers up to the
# hundreds of millions, but expanding it to the hundreds of billions would
# only require 2 more lines of code. With just a couple more elsifs, it could
# easibly be expanded to encompass all reasonable numbers we might deal with. 
# I assume there are more efficient ways out there, and I plan to look them up 
# after the challenge. I thought about putting all the letters into
# an array and then iterating over the array to place each element into a string
# with a commas in the correct places. Something like that would be a more scalabe solution,
# but would be more work for a use-case that only requires handling integers
# up to 9 digits. 

# Due to the sequential order that if statements follow, I was able to use just one
# comparison at each level. I then used the built-in insert method to place a
# comma into the string. This insert statement needs to work for integers with a couple
# different lengths, but I was able to index from -1 in order to avoid any additional if statements.
# When multiple commas were needed, i chained 2 insert statements together. Using
# a negative index counts up from the end of the number, so I needed to insert the
# higher-value comma first to make it work. 

# I like this type of challenge a lot. Thinking thorugh the logic of the algorithms is
# one of my favorite parts of coding, and when the output is relatively simple it gives us a lot of 
# freedom to get creative with our solutions. I had a lot of different ideas for this, but stuck
# to what i knew well for the solo challenge so I could get it done without doing any
# research. Now that the challenge is completed, I'm on my way to looking up the most
# efficient solution.
