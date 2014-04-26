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
# 5) else, declare a new variable new_array and set it equal to self
# 6) push (min_length - self.length) pad_values to new_array
# 6) return new_array

# 7) to make this a destructive method, we can remove step 5 and push the pad values to self

# 2. Initial Solution
class Array

	def pad(min_length, pad_value = nil)
		new_array = self.map { |x| x }
		if self.length >= min_length
			return new_array
		else
			puts new_array
			(min_length-self.length).times do
				new_array.push(pad_value)
			end
			puts "original array: #{self}"
			puts "new array: #{new_array}"
			return new_array
		end
	end

	def pad!(min_length, pad_value = nil)
		if self.length >= min_length
			return self
		else
			(min_length-self.length).times do
				self.push(pad_value)
			end
			return self
		end
	end
end


arr = [1,2,3,4,5]

arr.pad(9,"x")

# 3. Refactored Solution

class Array

	def pad(min_length, pad_value = nil)
		array = self.map { |x| x }
		length = array.length
		if length >= min_length
			return array
		else
			(min_length-length).times { array.push(pad_value) }
			return array
		end
	end

	def pad!(min_length, pad_value = nil)
		length = self.length
		if length >= min_length
			return self
		else
			(min_length-length).times {	self.push(pad_value) }
			return self
		end
	end
end


# 4. Reflection 

# I enjoyed this challenge - it gave me some insight as to how 
# ruby is working 'under the hood' when assigning variables. In my first
# attempt at the non-destructive function, I declared a variable 
# new_array and set it equal to self. The function worked properly, but
# my method was destructive and wouldn't pass the final test. I threw some 
# puts statements on to check the array at different times, and sure 
# enough my original array was changing even though I was pushing values
# to the variable new_array. 


# I was able to solve this problem by using the map function
# to actually create a new array. I passed the map function a simple block
# that didn't alter the array, but I can see the power of the map function
# when it comes to manipulating arrays. I'm now thinking that you might be 
# able to solve the insert_comma challenge by changing the number to an array
# and inserting commas using the map function. 

# For my refactored solution, I cleaned up my variable names and made 
# the methods more readable. I also used the shorthand notation on the
# lines where I pushed pad_values - the code was short enough I felt it
# looked on just one line. My solution didn't quite follow my pseudocode 
# becuase I didn't anticipate needing to use the map function.
 