# U2.W5: Die Class 1: Numeric


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: 
# => The input for Die class will be a positive integer, (sides)
# Output:
# => The output will be a new instance of the Die class, with the ability
#    to return the number of sides and generate a random number between 1 - sides
# Steps:
# 1) define the initialize method; the class method .new will use the initialize
#    method when creating a new class
# 2) Assign instance variable @sides to equal (sides), the argument that is passed when
#    creating a new instance of the Die class
# 3) in the initialize method, raise an ArgumentError unless @sides is a positive integer
# 4) within the Die class, define a new method called sides that will return @sides
# 5) within the Die class, define a new method called roll that will return a random
#    number between 1 and the number of @sides


# 3. Initial Solution

class Die
  def initialize(sides)
    @sides = sides
    if @sides < 1
    	raise ArgumentError, 'Number muts be a positive integer'
    end
  end
  
  def sides
    return @sides
  end
  
  def roll
    return (1 + rand(@sides))
  end
end




# 4. Refactored Solution

class Die
  def initialize(sides)
    @sides = sides
    raise ArgumentError, 'Number muts be a positive integer' unless @sides >= 1
  end
  
  def sides
    return @sides
  end
  
  def roll
    return (1 + rand(@sides))
  end
end

# My solution was already pretty DRY. For some extra practice, i re-wrote my if statement
# on one line using 'unless' instead. 



# 1. DRIVER TESTS GO BELOW THIS LINE

die = Die.new(100)

if die.sides == 100
	puts true
	puts "Your Die has #{die.sides} sides!"
else
	puts "Your Die did not produce the correct number of sides!"
end


if (1..die.sides).include?(die.roll)
	puts true
	puts "Your Die has #{die.sides} and just rolled #{die.roll}!"
else
	puts "Your Die has #{die.sides} but you just rolled a #{die.roll}!"
end

rolls = 100.times.map do die.roll end
puts rolls.count
if rolls.uniq.count > 60
	puts true
	puts "You rolled the Die 100 times and received #{rolls.uniq.count} unique values! That seems pretty random to me!"
else
	puts "Your rolled the Die 100 times and only received #{rolls.uniq.count} unique values .. might need to check your code"
end



# 5. Reflection 

# Talk about AHA moments! Classes are starting to make sense. The code Academy tutorials 
# took me through a similiar exercise, but I didnt really understand classes at that point.
# When you first hear that everything is an object, and objects make new objects, and there
# are instances of some objects, and there are methods that makes objects do things but
# those methods are just objects themsleves, it gets a little confusing. 

# I thought that the resources that we had for these challeneges were great - something definitely
# clicked when I read that the .new method is a method of Class, and the initialize 
# method is used whenever the .new method is called. It makes total sense now that you need
# to use arguments to create instance variables that you can then use with the rest of your class's 
# methods. The first 20 times I made a class and defined instance veriables I just took it for
# granted that's what you need to do, but never understood why. Seems so simple now! 

# I got a little creative with my driver tests this time. instead of doing plain == comparisons, 
# I did some if statements and gave my users output indicating how the test went. It doesnt
# conform exactly to the driver code test standards we were given, but I think this way is more 
# useful. 