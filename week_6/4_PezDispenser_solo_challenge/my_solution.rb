# U2.W6: PezDispenser Class from User Stories


# I worked on this challenge [by myself].

# 1. Review the following user stories:
# - As a pez user, I'd like to be able to "create" a new pez dispenser with a group of flavors that 
#      represent pez so it's easy to start with a full pez dispenser.
# - As a pez user, I'd like to be able to easily count the number of pez remaining in a dispenser 
#      so I can know how many are left.
# - As a pez user, I'd like to be able to take a pez from the dispenser so I can eat it.
# - As a pez user, I'd like to be able to add a pez to the dispenser so I can save a flavor for later.
# - As a pez user, I'd like to be able to see all the flavors inside the dispenser so I know the order 
#      of the flavors coming up.


# 2. Pseudocode

# 1) Define clas PezDispenser
# 2) Create an initialize method that takes two arguments, (flavors, qty = 100)
#    -flavors is an array of strings, qty is an integer
# 3) set instance variable @flavors = flavors
# 4) set instance variable @qty = qty
# 5) define instance method .pez_count that takes no arguments
# 6) return @qty
# 7) define instance method .see_all_pez that takes no arguments
# 8) return @flavors
# 9) define instance method add_pez that takes one argument (flavor)
# 10) add 1 to qty and push falvor to @favor instance variable 
# 11) define method get_pez that takes on arguments
# 12) subtract 1 from @qty and return the first element from the @flavors array using .reverse.pop


# 3. Initial Solution

class PezDispenser
	
	def initialize (flavors, qty = 100)
		@flavors = flavors
		@qty = qty
 	end

 	def pez_count
 		return @qty
 	end

 	def see_all_pez
 		return @flavors
 	end

 	def add_pez(flavor)
 		@flavors.push(flavor)
 	end

 	def get_pez
 		@qty -= 1
 		return @flavors.sample
 	end

end
 


# 4. Refactored Solution

class PezDispenser
	
	def initialize (flavors)
		@flavors = flavors; @qty = flavors.length
 	end

 	def pez_count
 		return @qty
 	end

 	def see_all_pez
 		return @flavors
 	end

 	def add_pez(flavor)
 		@qty += 1
 		@flavors.push(flavor)
 	end

 	def get_pez
 		@qty -= 1; 
 		this_pez = @flavors[0]
 		@flavors.delete_at(0)
 		return this_pez
 	end

end




# 1. DRIVER TESTS GO BELOW THIS LINE

flavors = %w(cherry chocolate cola grape lemon orange peppermint raspberry strawberry).shuffle
puts "these are the flavors you entered: #{flavors}"
puts "the flavors variable is is an array" if flavors.is_a?(Array) 
super_mario = PezDispenser.new(flavors)
puts "A new pez dispenser has been created. You have #{super_mario.pez_count} pez!"  
puts "Here's a look inside the dispenser:"  
puts "#{super_mario.see_all_pez}"
puts "Adding a purple pez."
super_mario.add_pez("purple")   # mmmmm, purple flavor
puts "#{super_mario.see_all_pez}"
puts "Now you have #{super_mario.pez_count} pez!"
puts "Oh, you want one do you?"
puts "The pez flavor you got is: #{super_mario.get_pez}"
puts "Now you have #{super_mario.pez_count} pez!"

def assert
	raise "Assertion Error!" unless yield
end

assert {super_mario.instance_variable_get(:@flavors).include?("purple") == true }
assert {PezDispenser.instance_method(:get_pez).arity == 0}
assert {PezDispenser.instance_methods(false) == [:pez_count, :see_all_pez, :add_pez, :get_pez]}
assert {super_mario.instance_variable_get(:@flavors).sort == flavors.sort}
puts super_mario.instance_variable_get(:@flavors).length
puts "#{super_mario.see_all_pez}"
assert {super_mario.instance_variable_get(:@qty) == super_mario.instance_variable_get(:@flavors).length}


# 5. Reflection 

# Initially I imagined the pez dispenser that held a maximum quantity, not
# one of each flavor. So I gave my pez dispenser a second parameter, qty, and 
# set it equal to 100 by default. Once I saw there was no handling for the quantity
# of each type of pez, it seemed clear that we were supposed to use the length of
# the flavors array to determine the quantity, so in my refactored solution I 
# re-worked the code to reflect that. I also combined some short lines and
# separated them with semi colons - I have no idea if this is best pratice or 
# not, but I like the style and im trying to make my code steezy. Finally, I also
# changed it to give a random pez from the dispenser, because what's the fun
# in knowing what color comes next?

# Over-all, I found this to be a pretty easy challenge. I'm definitely getting the
# hang of object-oriented programming and using classes. The user stories helped
# me guide what my methods did - for instance, the last driver story wants to see
# what flavors were are inside so you can tell which is coming up. That told me
# there was a specific order to the pez, and that they would want to receive
# the first flavor in the @flavors array. 

# Writing the assertion stories helped me to fix a bug I didnt notice in my code. 
# Using the .pop method was working to return a pez, but it was not deleting that
# pez from the array. I ended up having to add 2 additonal lines, but the code now runs
# correctly.

