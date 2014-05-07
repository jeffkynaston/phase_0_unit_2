# U2.W6: Testing Assert Statements

# I worked on this challenge [by myself, with: ].


# 2. Review the simple assert statement

# This creates a method, assert, that will raise a "Runtime Error"
# and puts the statement "assertion failed!" unless the block of 
# code passed to it evaluates to true
def assert
  raise "Assertion failed!" unless yield
end

# assigns the string 'bettysue' to the variable name
name = "bettysue"
# passes a logical test as a block of code to the assert method
# if true, the assert method will yield and do nothing
# if false, the assert method will not yield and will raise an error
assert { name == "bettysue" }
# assert { name == "billybob" }

# 2. Pseudocode what happens when the code above runs

# Done Above

# 3. Copy your selected challenge here

class GuessingGame
  def initialize(answer)
    @answer = answer
    @solved = false
    puts "Welcome to the Guessing Game!\n---------------------------------------"
  end
  
  def guess(guess)
  	@guess = guess
  	if @guess > @answer
  		@solved = false
  		return :high
  	elsif @guess < @answer
  		@solved = false
  		return :low
  	else
  		@solved = true
  		return :correct
  	end
  end

  def solved?
  	puts "Your last guess was #{@guess}!"
  	if @solved
  		puts "Correct!"
  	else 
  		puts "Wrong!"
  	end
  	return @solved
  end

end



# 4. Convert your driver test code from that challenge into Assert Statements

puts GuessingGame.instance_method(:initialize).arity == 1
# Checks that the game requires one argument to initialize
puts GuessingGame.instance_method(:guess).arity == 1
# Checks that the class method guess requires one argument
puts GuessingGame.instance_methods(false) == [:guess, :solved?]
# checks to see that the class GuessingGame has the correct methods defined,
# guess & solved?. Using the (false) parameter here excludes all inherited methods
game = GuessingGame.new(10)
puts game.instance_variable_get(:@answer) == 10
# Checks to see that the (answer) argument is being passed correctly into the 
# @answer instance variable

def assert
  raise "Assertion failed!" unless yield
end

assert {GuessingGame.instance_method(:initialize).arity == 1}
assert {GuessingGame.instance_method(:guess).arity == 1}
assert {GuessingGame.instance_methods(false) == [:guess, :solved?]}
assert {game.instance_variable_get(:@answer) == 10}
assert {game.guess(20) == :high}
assert {game.guess(10) == :correct}
assert {game.guess(5) == :low}


# 5. Reflection

# I chose to go with the guessing game challenge because I had used some more 
# creative driver code on that one, using instance_method().arity to check for
# arguments and instance_variable_get() to check for the value of instance 
# variables

# All in all, it was pretty simple to turn driver code into assert statements. 
# When creating these, I have noticed that it is easiest if i Pseudocode
# out the tests I want to do. Once I know what I want to test for, I can look
# up in ruby docs how to do it. 