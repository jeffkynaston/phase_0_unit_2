# U2.W5: Implement a Reverse Polish Notation Calculator


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: The Input is a math problem in reverse polish notation
# Output: The output is a fully evaltated reverse polish notation expression
# Steps:
# 1) Split the problem into an array
# 2) Iterate over the array until you find an operator, apply that operator to the
#    two previous array elements
# 3) Update one of those array elements with the answer, delete the other array element
#    and the operator
# 4) Repeat until all operators are deleted
# 5) use reduce to add up all elements in the array

# 3. Initial Solution

# class RPNCalculator
#   def initialize
#   end

#   def evaluate(problem)
#   	array = problem.split(" ")
  	
#   	puts "initial array: #{array}"
#   	array.each_with_index do | obj, i |
#   		case obj
#   		when "-"
#   			puts "before operation: #{array}"
#   			operation = array[i-1].to_i-array[i-2].to_i
#   			array[i-2] = operation
#   			2.times { array.delete_at(i-1) }
#   			puts "after operation: #{array}"
#   			break
#   		when "+"
#   			puts "before operation: #{array}"
#   			operation = array[(i-1)].to_i + array[(i-2)].to_i
#   			array[i-2] = operation
#   			2.times { array.delete_at(i-1) }
#   			puts "after operation: #{array}"
#   			break
# 			when "*"
# 				puts "before operation: #{array}"
#   			operation = array[i-1].to_i * array[i-2].to_i
#   			array[i-2] = operation
#   			2.times { array.delete_at(i-1) }
#   			puts "after operation: #{array}"
#   			break
#   		end
#   	end

#   	if array.include?("-") || array.include?("+") || array.include?("*")
#   		array.each_with_index do | obj, i |
#   		case obj
#   		when "-"
#   			puts "before operation: #{array}"
#   			operation = array[i-1].to_i-array[i-2].to_i
#   			array[i-2] = operation
#   			2.times { array.delete_at(i-1) }
#   			puts "after operation: #{array}"
#   			break
#   		when "+"
#   			puts "before operation: #{array}"
#   			operation = array[(i-1)].to_i + array[(i-2)].to_i
#   			array[i-2] = operation
#   			2.times { array.delete_at(i-1) }
#   			puts "after operation: #{array}"
#   			break
# 			when "*"
# 				puts "before operation: #{array}"
#   			operation = array[i-1].to_i * array[i-2].to_i
#   			array[i-2] = operation
#   			2.times { array.delete_at(i-1) }
#   			puts "after operation: #{array}"
#   			break
#   		end
#   	end
#   	end

#   	if array.include?("-") || array.include?("+") || array.include?("*")
#   		array.each_with_index do | obj, i |
#   		case obj
#   		when "-"
#   			puts "before operation: #{array}"
#   			operation = array[i-1].to_i-array[i-2].to_i
#   			array[i-2] = operation
#   			2.times { array.delete_at(i-1) }
#   			puts "after operation: #{array}"
#   			break
#   		when "+"
#   			puts "before operation: #{array}"
#   			operation = array[(i-1)].to_i + array[(i-2)].to_i
#   			array[i-2] = operation
#   			2.times { array.delete_at(i-1) }
#   			puts "after operation: #{array}"
#   			break
# 			when "*"
# 				puts "before operation: #{array}"
#   			operation = array[i-1].to_i * array[i-2].to_i
#   			array[i-2] = operation
#   			2.times { array.delete_at(i-1) }
#   			puts "after operation: #{array}"
#   			break
#   		end
#   	end
#   	end

#   	# puts array
#   	return array.map { |obj| obj.to_i }.reduce(:+)
#   end
# end



# 4. Refactored Solution

class RPNCalculator
  def initialize
  end

  def evaluate(problem)
  	@calc = problem
  	# puts "array: #{@calc}" # => Un-comment if you would like to see the array at each stage
  	if @calc.include?("-") || @calc.include?("+") || @calc.include?("*")
  		@calc = @calc.split(" ") if @calc.is_a?(String)
  		combine(@calc)
  		evaluate(@calc)
  	else
  		return @calc.to_i if @calc.is_a?(String)
  		return @calc.map { |obj| obj.to_i }.reduce(:+)
  	end
  end

  def combine(array)
  	
  	array.each_with_index do | obj, i |	
	  		case obj
	  		when "-"
	  			operation = array[i-2].to_i-array[i-1].to_i
	  			array[i-2] = operation
	  			2.times { array.delete_at(i-1) }
	  			break
	  		when "+"
	  			operation = array[(i-1)].to_i + array[(i-2)].to_i
	  			array[i-2] = operation
	  			2.times { array.delete_at(i-1) }
	  			break
				when "*"
	  			operation = array[i-1].to_i * array[i-2].to_i
	  			array[i-2] = operation
	  			2.times { array.delete_at(i-1) }
	  			break
	  		end
	  	end
  	
  end
end




# 1. DRIVER TESTS GO BELOW THIS LINE

calc = RPNCalculator.new
puts calc.evaluate('0')
puts calc.evaluate('1 2 +')
puts calc.evaluate('70 10 4 + 5 * -') # => 0
puts calc.evaluate('20 10 5 4 + * -') # => -70

puts calc.evaluate('0') == 0
puts calc.evaluate('1 2 +') == 3
puts calc.evaluate('70 10 4 + 5 * -') == 0
puts calc.evaluate('20 10 5 4 + * -') == -70


# 5. Reflection 

# This challenge seemed much more simple than it ended up being. I understood the 
# algorithm that needed to be run, but I ran into some probelms implementing it. The biggest
# issue occured when I deleted array elements. That deletion shifted the index of the array
# and threw off my each loop, causing the method to calculate incorrectly. I considered
# replacing array elements with 0s instead of deleting them, but ran into problems with that
# solution too. In the end, I decided to break the loop each time an operation was completed,
# and then re-start the loop with the updated equation.

# My first solution was pretty ugly - I had been working on it for a while so when I finally 
# figured out how to make it work, I threw a few if statements in and just copied my code 
# three times. It was a perfectly fine, working solution, but it needed some refactoring and
# recursion was a perfect fit for it. I created a second instance method called combine that
# would loop through an array until it found its first operation, perform that operation, 
# replace the element in the array, and break. 

# With that complexity factored out, the evaluate is now much more simple. It first checks to
# see if there are any operating signs left in the equation. If so, it passes the equation to
# the combine method and then calls itself using the new, updated equation. It repeats this
# process until there are no more operating signs in the equation, at which point it adds all 
# of the integers in the equation and returns the result. oop and recursion! Suprised myself by
# coming up with all of that on my own. 