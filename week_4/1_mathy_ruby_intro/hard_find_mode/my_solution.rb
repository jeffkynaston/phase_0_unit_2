# U2.W4: Calculate the mode!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself].

# 1. Pseudocode

# What is the input?
# -The input is an array of unknown elements
# What is the output? (i.e. What should the code return?)
# The output is the mode of the array - the element that is repeated the most
# This can be a string or a number
# What are the steps needed to solve the problem?
# 1) Define a method called mode that takes one argument, (array)
# 3) Create a default message if there is no mode, store that in a variable
#    called arrayMode that will be returned at the end of the method
# 4) Create an initial count variable and set it equal to 1
# 5) Create a counter variable
# 2) loop through the array and use the enumerable detect function to 
#    find the number of each element in the araray. store that number in a variable 
#    called count
# 3) If an item in the array has a higher count than the initial count, 
#    update arrayMode to be the that element in the array. 


# 2. Initial Solution

def mode(array)
	initialCount = 1
	arrayMode = []
	i = 0
	while array[i] 
		puts "array element: #{array[i]}"
	  count = array.count {|j| j == array[i]}
	  puts "this element occurs #{count} times"
	  if count > initialCount
	  	initialCount = count
	  	puts "this element is the new mode"
	  	arrayMode = [array[i]]
	  elsif count == initialCount && count != 1
	  	puts "this element is also a mode and will be added to the mode"
	  	arrayMode.push(array[i])
	  end
	  i += 1
	end
	arrayMode = arrayMode.uniq
	return arrayMode

end

array = [1, 2, 3, 4, 5, 5, 7]
puts mode(array)
puts "------------------Next Array------------------------"
array = [4, 4, 5, 5, 6, 6, 6, 7, 5]
puts mode(array)
puts "------------------Next Array------------------------"
array = ["apple", "banana", "clementine", "banana", "cherry", "strawberry", "cherry"]
puts mode(array)


# 3. Refactored Solution

def mode(array)
	initialCount = 1
	arrayMode = []
	i = 0
	while array[i] 
	  count = array.count {|j| j == array[i]}
	  if count > initialCount
	  	initialCount = count
	  	arrayMode = [array[i]]
	  elsif count == initialCount && count != 1
	  	arrayMode.push(array[i])
	  end
	  i += 1
	end
	arrayMode = arrayMode.uniq
	return arrayMode
end

# Refactored to use each instead of a while loop with counters

def mode(array)
	initialCount = 1
	arrayMode = []
	array.each do |element|
	  count = array.count {|j| j == element}
	  if count > initialCount
	  	initialCount = count
	  	arrayMode = [element]
	  elsif count == initialCount && count != 1
	  	arrayMode.push(element)
	  end
	end
	arrayMode = arrayMode.uniq
	return arrayMode
end


# 4. Reflection 

# This was a tough one for me. Took me over an hour, but I was determined and
# I finally figured it out. Part of my problem was using the enumerable 
# detect function - it didn't work like I thought it would, and I ended
# up using count instead. 

# My initial solution strayed a little from my pseudocode because I didn't 
# think through what I would need to do with an array that had multiple modes. 
# When i was on the pseudocode step, I found it was hard to get through the 
# entire solution without starting to code the method - I needed to try things
# out first before I kept strategizing about the algorithm. 

# You might also notice in my initial solution that there are a lot of puts
# statements all over the place. I have found that this is my most effective
# way of troubleshooting the logic in algorithms - My first shot at coding
# doesn't always do what I want it to, so it's really helpful to have some
# output at every step of the way through. This time, I added sentences to 
# that output to help me understand what the function was doing. 

# For my refactored solution, I removed the puts and it changed the average
# runtime from .01 seconds to .002 seconds. I am also getting comfortable now
# with using the each function (instead of a while loop) to iterate over
# the array, so I refactored a version like that too. 

# In all - great exercise. It was definitely worth the time I put into it. 