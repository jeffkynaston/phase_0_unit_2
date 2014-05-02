# U2.W5: Build a simple guessing game SOLO CHALLENGE


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input:
# => The input for GuessingGame will be an integer, (answer)
# Output:
# => The output will be an instance of the GuessingGame class, with the
#    ability to accept guesses and return clues 
# Steps:
# 1) create a new class, GuessingGame
# 2) define an initialize method with one parameter, (answer)
# 3) within the initialize method, define instance variable @answer to equal (answer)
# 4) define instance variable @solved to equal false
# 5) define a class method, guess, which takes one argument (guess)
# 6) Use an if statement to check if the guess is correct
#    If higher, set @solved to false and return symbol :high
#    If lower, set @solved to false and return symbol :low
#    Else, guess must be correct so set @solved to true and return :correct 
# 7) define class method, solved?, which takes no arguments
# 8) within the solved? method, return the instance variable @solved

# 3. Initial Solution

class GuessingGame
  def initialize(answer)
    @answer = answer
    @solved = false
  end

  def guess(guess)
  	if guess > @answer
  		@solved = false
  		return :high
  	elsif guess < @answer
  		@solved = false
  		return :low
  	else
  		@solved = true
  		return :correct
  	end
  end

  def solved?
  	return @solved
  end

end

game = GuessingGame.new(10)

puts game.solved?   # => false

puts game.guess(5)  # => :low
puts game.guess(20) # => :high
puts game.solved?   # => false

puts game.guess(10) # => :correct
puts game.solved?   # => true


# 4. Refactored Solution

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

# game = GuessingGame.new(10)

# puts game.solved?   # => false

# puts game.guess(5)  # => :low
# puts game.guess(20) # => :high
# puts game.solved?   # => false

# puts game.guess(10) # => :correct
# puts game.solved?   # => true

# game = GuessingGame.new rand(100)
# last_guess  = nil
# last_result = nil

# until game.solved?
#   unless last_guess.nil?
#     puts "Oops!  Your last guess (#{last_guess}) was #{last_result}."
#     puts ""
#   end

#   print "Enter your guess: "
#   last_guess  = gets.chomp.to_i
#   last_result = game.guess(last_guess)
# end

# puts "#{last_guess} was correct!"

# My code was already pretty DRY, so in my re-factored solution I gave the game a little
# more functionality. First, I gave the initialize method a nice-looking title so when the game
# is launched, it doesn't go directly into the "Enter your guess prompt". Seems like putting
# text or instructions or titles in the initialize method could be a useful thing. 
# Second I changed the guess method to create and use an @guess instance variable. It's one 
# extra line of code, but it enables us to now use the @guess variable other places in the 
# program, like in the solved? method. The version of the game with the front-end provided
# by DBC handles this last guess functionality, but the more simple version of the game (without
# interactive guessing) does not. 


# 1. DRIVER TESTS GO BELOW THIS LINE

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


# 5. Reflection 

# Initially I defined my @solved variable outside my instance method. Once we found
# the correct guess, this @solved variable evaluated correctly to true, however, 
# until it was found, the instance of my class didn't understand @solved, since it wasn't
# initialized with it. 

# The rspec tests realy drove my development and refactoring on this one. I was able to 
# get the game to look & act right even without passing all the tests. I had to play around
# with the placement and declarations of my variables in order to get everything to pass, which
# made me think a lot about variable declaration and the implications of using different types
# of variables (local vs instance etc). For example, I wanted to remove the @solved = false from
# the first two conditoinals in my guess method, but it broke one of the tests. This happened even though
# @solved was initially set to false, so when @solved is evaluated after an incorrect guess it 
# still correctly showed false. 

# I thought all of the last 3 challenges helped a lot with my understanding of classes and 
# instance variables. Instance variables represent the characteristics of an object. They can be 
# created when the object is first intitialzied (through parameters passed to the .new method) or 
# through the use of a class method (such as in my guess method in this challenge). Instance variables
# will be saved and kept for the life of the object and can be changed. Thus far our instance
# variables have been pretty basic, but if these were more complex Classes, like a Customer in a 
# database, they would probably have a unique ID# as one of their instance variables. 

# Instance methods represent the actions of an object - they provide ways to alter the instnace
# variables (characteristics) of an object. For example, if an object has an instance variable,
# location, then a move method would alter that location variable by some amount, effectively 
# moving that object. 