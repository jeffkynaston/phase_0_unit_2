# U2.W4: Add it up!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself].

# 1. Pseudocode

# What is the input?
# -The input is an array of unknown length
# What is the output? (i.e. What should the code return?)
# -The output is either a sum of all the array's elements or a sentence with
# -all array elements in it. 
# What are the steps needed to solve the problem?
# -1) total method
# -a. Define a method 'total' that takes one argument, (array)
# -b. Set variable 'sum' equal to 0. This variable will hold the total
# -c. Set variable 'i' equal to 0. This variable will be a counter
# -d. Create a while loop to iterate over the array. During the loop, add each
#     array element to 'sum', and then add 1 to 'i'
# -e. outside the loop, return sum and end the function
# -2) sentence_maker method
# -a. Define a method 'sentence_maker' that takes one argument, (array)
# -b. call ruby's built-in join method on the array with a blank space as 
#     the argument; call ruby's built-in capitalize method on the result

# 2. Initial Solution

def total(array)
	sum = 0
	i = 0
	while array[i] 
		sum += array[i]
		i += 1
	end
	return sum
end

def sentence_maker(array)
	return array.join(" ").capitalize + "."
end

# 3. Refactored Solution



# 4. Reflection 