# U2.W4: Pad an Array

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself].

# 1. Pseudocode

# What is the input?
# => The input is an array of any size or type, along with two arguments:
#    a minimum length
#    an optional pad value
# What is the output? (i.e. What should the code return?)
# => The output will be the intial array and, if needed, additoinal pad values
# What are the steps needed to solve the problem?
# 1) First, initialize the Array class so that we can make this a method of
#    that class
# 2) Then define a method called pad that takes two arguments, (min_length, pad_value = nil)
#    this will make the second parameter optional, and pad the array with nil values 
#    if no paramter is specificed
# 3) Use an if statement to check if the length of the array is >= than min_length
# 4) If yes,  return the original array
# 5) else, push (min_length - self.length) pad_values to the array
# 6) return the array

# 2. Initial Solution
class Array

	def pad(min_length, pad_value = nil)
		if self.length >= min_length
			return self
		else
			new_array = self
			(min_length-self.length).times do
				new_array.push(pad_value)
			end
			return new_array
		end
	end
end


# arr = [1,2,3,4,5]

# puts arr.pad(9,"x")

# 3. Refactored Solution



# 4. Reflection 