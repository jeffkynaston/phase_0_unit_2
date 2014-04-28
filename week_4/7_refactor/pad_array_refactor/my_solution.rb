# U2.W4: Review and Refactor: Pad an Array

# I worked on this challenge [by myself].



# 1. First Person's solution I liked - Britney Van Valkenburg
#    What I learned from this solution
# This solution was a lot like my own, except that Britney used the 
# .dup method to create a non-destructive method instead of 
# using the map function to create a new array. Using this is slightly 
# shorter, since you don't have to specify any paramters for it 
# to work. It also makes more sense to me when i'm reading the code -
# duplicating the array sounds more accurate than mapping the array. 

# Copy solution here:

class Array
	def pad(min_size, filler=nil)
		if self.length >= min_size
			return self.dup
		else
			padded = self.dup
			until padded.length == min_size
				padded.push(filler)
			end
		end
		return padded
	end

	def pad!(min_size, filler=nil)
		if self.length >= min_size
			return self
		else
			until self.length == min_size
				self.push(filler)
			end
		end
		return self
	end
end



# 2. Second Person's solution I liked - Josh Jeong
#    What I learned from this solution
# First, I learned that I didn't need a conditional statement. 
# We both used a times method to push padding onto the array, but
# his statement doesn't check to see if the array length is greater
# than the minimum length. It just (correctly) pushes 0 padding
# elemtns to the array if self.length is greater than or equal to 
# the minimum length. 


# Copy solution here:

class Array
  def pad!(number, padding = nil)
  	(number - self.length).times {self.push(padding)}
  	replace(self)
  end


  def pad(number, padding = nil)
    dup.pad!(number, padding)
  end
end





# 3. My original solution:

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


# 4. My refactored solution:

class Array

	def pad!(min_length, pad_value = nil)
		(min_length-length).times {	self.push(pad_value) }
		return self
	end		


	def pad(min_length, pad_value = nil)
		dup.pad!(min_length, pad_value)
	end
end


# 5. Reflection

# I enjoyed this exercise - reviewing other solutions was a big help for
# re-factoring my own. Once I learned how you could use the .dup method 
# to re-use your code and create a non-destructive method, it was very
# quick for me to refactor my initial solution. In fact, I didn't have to
# alter any existing code, all i had to do was remove a few lines. 

# Both Britney and Josh used the .dup method, although they did so in two
# different ways. It was great seeing a variety of solutions (most all of
# them using .dup in some way or another). Since everyone else seemed to use it
# and I didnt, it will definitely stick with me. I'm sure i'll be using it in the future. 