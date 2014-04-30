# U2.W5: Die Class 2: Arbitrary Symbols


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: 
# => The input for Die class will be a an array of length > 1, (symbols)
# Output:
# => The output will be a new instance of the Die class, with the ability
#    to return the number of sides and generate a random side of the dice
# Steps:
# 1) define the initialize method
# 2) Assign instance variable @symbols to equal (symbols), the array argument that is passed when
#    creating a new instance of the Die class
# 3) in the initialize method, raise an ArgumentError if the array length is less than 1
# 4) within the Die class, define a new method called sides that will return @symbols.length
# 5) within the Die class, define a new method called roll that will return a random
#    element frmo the @symbols array


# 3. Initial Solution

class Die
  def initialize(symbols)
  	@symbols = symbols
  	raise ArgumentError, 'You must have at least 1 symbol' if @symbols.length < 1
  end

  def sides
  	return @symbols.length
  end

  def roll
  	return @symbols.sample
  end

  def show_sides
  	if @symbols.is_a? Array
  		return "Your dice has #{@symbols.length} sides: #{@symbols}"
  	end
  end

end


# 4. Refactored Solution

class Die
  def initialize(symbols)
  	@symbols = symbols
  	raise ArgumentError, 'You must have at least 1 symbol' if @symbols.length < 1
  end

  def sides
  	return @symbols.length
  end

  def roll
  	return @symbols.sample
  end
end

# In my refactored solution I removed the extra method I defined, but other than 
# that it is as DRY as I can get it. Technically, I could remove the 'return' 
# from both the sides and roll methods, but stylisticly I prefer to keep them
# in there. The length and sample functions used in these methods are very short,
# and the initialize method is only 2 lines. 



# 1. DRIVER TESTS GO BELOW THIS LINE

die = Die.new(['A', 'B', 'C', 'D', 'E', 'F'])
puts die.sides # still returns the number of sides, in this case 6
puts die.roll # returns one of ['A', 'B', 'C', 'D', 'E', 'F'], randomly
puts die.show_sides

puts "The dice has at least 1 side:"
puts die.sides != 0
puts "The dice returns the correct number of sides on the dice:"
puts die.sides == ['A', 'B', 'C', 'D', 'E', 'F'].length
puts "The dice returns one of the correct sides:"
puts ['A', 'B', 'C', 'D', 'E', 'F'].include? die.roll



# 5. Reflection 

# This was a pretty easy modification from our previous dice example. My initial 
# thought was that we would need to have a variable number of arguments, but once
# I started working on the challenege, I realized that arrays can have a variable
# number of elements, and there would still be just one argument ( an array ).

# In my initial solution, I defined another method show_sides	to 1) test that 
# the variable being passed was, in fact, an array and 2) show the user the 
# sides of the dice that were entered. 

# I am also getting more used to writing driver code. I like the driver code aspect
# to these challenges because it gets us some more practice with conditionals and built-in ruby methods
# (i just used .include? and had to look up the proper syntax again ... maybe after another
# 5 or 10 times i'll start to remember it. )