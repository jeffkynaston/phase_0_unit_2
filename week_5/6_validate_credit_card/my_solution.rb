# I worked on this challenge [Jeff K, Jeuel W].

# 2. Pseudocode

# Input: 16-digit numbers for intialized class
# Output: true or false
# Steps: 
# step 1. create intialized method, take 1 argument (number)
# step2. assign instance variable #number = number
# step3. raise arg error if num.length != 16
# step4. new method, double, to make an array from number and
# step5. iterate over array (with odd method) to double every odd number
# step6. new method, sum_num, to sum all the digits in the array 
# step7. join all the array elements into string
# step8. re-split, each character, into array
# step9. check_card to check if sumed array is divisable by ten


# 3. Initial Solution

# Don't forget to check on intialization for a card length
# of exactly 16 digits


class CreditCard

    def initialize(number)
        @number = number.to_s
        raise ArgumentError.new("The Credit Card Number has to be 16 digits!!!") unless @number.length == 16
    end
    
    
  def check_card
    num_array = @number.split("")
    puts "num array before double: #{num_array}"
    num_array.each_with_index do |obj, i|
      if i.even?
      	# puts obj 
        obj = (obj.to_i * 2)
        num_array[i] = obj
        # puts obj
      end
     end
    puts "num array after double: #{num_array}"
    re_string = num_array.join("")
    puts "re string: #{re_string}"
    re_split = re_string.split("")
    puts "re split: #{re_split}"
    int_array = re_split.map { |i| i.to_i }
    puts "int array: #{int_array}"
    final = int_array.reduce(:+)
    puts "final: #{final}"
    if final % 10 == 0
      return true
    else
      return false
    end
  end
  
end




# 4. Refactored Solution

# class CreditCard

class CreditCard

    def initialize(number)
        @number = number.to_s
        raise ArgumentError.new("The Credit Card Number has to be 16 digits!!!") unless @number.length == 16
    end
    
  def check_card
    num_array = @number.split("")
    num_array.each_with_index do |obj, i|
        num_array[i] = (obj.to_i * 2) if i.even?
     end
     return true if num_array.join("").split("").map { |i| i.to_i }.reduce(:+) % 10 == 0
     return false
  end
end



# 1. DRIVER TESTS GO BELOW THIS LINE

#number of digits should be 16
puts CreditCard.instance_method(:initialize).arity == 1
puts CreditCard.instance_method(:check_card).arity == 0

card = CreditCard.new(4563960122001999)
puts card.instance_variable_get(:@number) == "4563960122001999"
puts card.check_card == true

card = CreditCard.new(4408041234567892)
puts card.instance_variable_get(:@number) == "4408041234567892"
puts card.check_card == false



# puts "dbc card: #{CreditCard.new(4563960122001999).check_card}"

# if CreditCard.new(0123456789123456).check_card 
#   puts "thanks for shopping"
# else
#   puts "You did not enter a valid credit card"
# end

# Reflections

# Jeuel and I had a good time with this challenge. As you can tell from all the 
# puts statements, our initial solution didn't work the first time we ran it. 
# By seeing the output at every step in the algorithm, we were able to identify
# that values were being doubled correctly, but not being stored back into the array. 

# During the Pseudocode stage, and even when we started our initial solution, we split
# the algorithm up into multiple methods. But an error we ran into was that local
# variables didn't carry over between methods. Of course, there are other was to fix this 
# (we could use instance variables) but it was very quick for us to put the 
# entire algorithm into one method. Especially with our refactored solution,
# where we are chaining all the methods into one line, using a single
# function makes more sense.  
