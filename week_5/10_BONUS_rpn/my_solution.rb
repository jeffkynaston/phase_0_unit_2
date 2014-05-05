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
  	puts "array: #{@calc}"
  	if @calc.include?("-") || @calc.include?("+") || @calc.include?("*")
  		@calc = @calc.split(" ") if @calc.is_a?(String)
  		combine(@calc)
  		evaluate(@calc)
  	else
  		return @calc.map { |obj| obj.to_i }.reduce(:+)
  	end
  end

  def combine(array)
  	
  	array.each_with_index do | obj, i |	
	  		case obj
	  		when "-"
	  			operation = array[i-1].to_i-array[i-2].to_i
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
puts calc.evaluate('1 2 +')
puts calc.evaluate('70 10 4 + 5 * -') # => 0




# 5. Reflection 
