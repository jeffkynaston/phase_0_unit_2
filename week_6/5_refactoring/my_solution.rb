# U2.W6: Refactoring for Code Readability


# I worked on this challenge [by myself].


# Original Solution 

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



# Refactored Solution

class CreditCard

  def initialize(number)
      @number = number.to_s
      @num_array = @number.split("")
      @sum = 0
      raise ArgumentError.new("The Credit Card Number has to be 16 digits!!!") unless @number.length == 16
  end
    
  def check_card
    self.double_digits
    self.sum_digits
    self.divisible_by_10?
  end 
    
  # iterate over the array to double every even digit and replace that element with its double
  def double_digits
    @num_array.each_with_index do |obj, i|
        @num_array[i] = (obj.to_i * 2) if i.even?
     end
   end

  # join the array into a string, then re-split to separate double-digit numbers
  # map the array of strings to integers and reduce (add) them into one number
  def sum_digits
    @sum = @num_array.join("").split("").map { |i| i.to_i }.reduce(:+)
  end

  def divisible_by_10?
    return true if @sum % 10 == 0
    return false
  end

end





# DRIVER TESTS GO BELOW THIS LINE

puts CreditCard.instance_method(:initialize).arity == 1
puts CreditCard.instance_method(:check_card).arity == 0

card = CreditCard.new(4563960122001999)
puts card.instance_variable_get(:@number) == "4563960122001999"
puts card.check_card == true

card = CreditCard.new(4408041234567892)
puts card.instance_variable_get(:@number) == "4408041234567892"
puts card.check_card == false


def assert
  raise "Assertion Failed!" unless yield
end

assert { CreditCard.instance_method(:initialize).arity == 1 }
assert { CreditCard.instance_method(:check_card).arity == 0 }

card = CreditCard.new(4563960122001999)
assert { card.instance_variable_get(:@number) == "4563960122001999"}
assert { card.check_card == true }

card = CreditCard.new(4408041234567892)
assert { instance_variable_get(:@number) == "4408041234567892" }
assert { card.check_card == false }





# Reflection 

#  My original solution was short and DRY, but not that clear. Obviously since I've 
#  written and re-factored this already I know what's giong on, but the entire
#  thing is only one method. A lot of the refactoring principals mentioned in this 
#  challenge had to do with short, clear, readable methods so I wanted to refactor 
#  my own solution to meet these standards. 

#  made a method for each step of the algoritm, and then made a check_card method that
#  called all three methods in a row. The names of my methods are discriptive, so you
#  can tell what they are doing to the card without coments. For the code within
#  the methods, I preferred to keep it as DRY as possible and leave a comment about
#  make up for the complexity. 

#  One thing I noticed ws that I had to create additional instance variable and define
#  them in my initialize method. 