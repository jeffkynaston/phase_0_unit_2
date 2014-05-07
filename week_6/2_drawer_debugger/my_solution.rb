# U2.W6: Drawer Debugger


# I worked on this challenge [by myself, with: ].


# 2. Original Code

class Drawer

  attr_reader :contents
  
  # Are there any more methods needed in this class?
  
  def initialize
    @contents = []
    @open = true
  end
  
  def open
    @open = true
  end
  
  def close
    @open = false
  end 
  
  def add_item (item)
    @contents << item
  end
  
  def remove_item(item = @contents.pop) #what is `#pop` doing?
    @contents.delete(item)
  end
  
  def dump  # what should this method return?
    puts "Your drawer is empty"
    @contents = []
  end
  
  def view_contents
    if @contents.length == 0
      puts "The drawer is empty"
    else
    
      puts "The drawer contains:"
      @contents.each {|silverware| puts "- " + silverware.type }
    end
  end
end  
  
  
class Silverware
  attr_reader :type
  
  # Are there any more methods needed in this class?
  
  def initialize(type, clean = true)
    @type = type
    @clean = clean
  end
  
  def eat
    puts "eating with the #{type}"
    @clean = false
  end
  
  def clean_silverware
    puts "#{@type} is now clean"
    @clean = true
  end

end



silverware_drawer = Drawer.new

knife1 = Silverware.new("knife")
silverware_drawer.add_item(knife1) 

silverware_drawer.add_item(Silverware.new("spoon"))

fork1 = Silverware.new("fork")
silverware_drawer.add_item(fork1) # New fork is created and added to drawer
removed_fork = silverware_drawer.remove_item(fork1) #add some puts statements to help you trace through the code...
removed_fork.eat



sharp_knife = Silverware.new("sharp_knife")
silverware_drawer.view_contents
silverware_drawer.add_item(sharp_knife)
silverware_drawer.view_contents
removed_knife = silverware_drawer.remove_item(sharp_knife)
silverware_drawer.view_contents
removed_knife.eat
removed_knife.clean_silverware 


silverware_drawer.view_contents



silverware_drawer.view_contents
silverware_drawer.dump
silverware_drawer.view_contents #What should this return?



#BONUS SECTION
# puts fork.clean

# DRIVER TESTS GO BELOW THIS LINE
def assert
  raise "Assertion failed!" unless yield
end

# test amount of items in drawer
silverware_drawer.add_item(knife1) 
silverware_drawer.add_item(Silverware.new("spoon"))
assert{silverware_drawer.instance_variable_get(:@contents).length == 2}

# test to see if specific item in drawer
assert{silverware_drawer.instance_variable_get(:@contents).include?(knife1)}

# test if silverware is clean
assert{knife1.instance_variable_get(:@clean) == true}

# test dump
silverware_drawer.dump
assert{silverware_drawer.instance_variable_get(:@contents).length == 0}







# 5. Reflection 

# Obviously objects of multiple classes work together all the time, but I had
# never done a challenge like this where I create two classes of objects that
# interact. It turned out to be pretty simple, but it took me a little bit of
# time to think through the scope of the variables. silverware_drawer, knife1,
# fork1, sharp_knife, are all variables that Im dealing with in the current scope. 
# A spoon also gets put in the drawer, but it is not assigned a variable in the
# current scope. Most of the methods reside in the silverware drawer class, so 
# they get called on the instance, silverware_drawer. knife1, fork1, and sharp_knife
# are sometimes passed into these methods as parameters, when adding or removing
# items from the drawer. When items are put in the drawer, those variables
# (class Silverware objects) are put into the instance variable :@contents array. 
# this part was hard for me to visualize - normally i'm used to seeing integers and
# strings and even other arrays - but this array is literally full of SIlverware 
# objects - so i'm actually visualizing knifes and forks in this array 

# When I did this challenge we just jumped right into bug-fixing without 
# running through all of that in detail. We were able to figure it out okay, but
# Since we didn't fully undersatnd what was going on, it took us a little extra time
# to fix all the errors. During the bug-fixing process, we ended up moving code around
# (code outside the classes) to group operations done on each current variable (fork1, knife1,
# sharp_knife) so we could compare them. This actually made the third step harder,
# becuase the output that the .rb file produced was no longer in the correct spot. We
# had to create a new string of output that tested the classes and their methods in order
# to tell whether or not the methods were working correctly. 

# I liked using the assert statements, mostly becuase they don't give you any output
# if the tests run correctly. however, there isn't any specific output to the console
# when the tets fail, except for a line number, so it would require the additional
# step of reviewing the driver code to see what assertion failed. When I use the more
# simple version of driver code, i can add if and puts statemetns to give myself
# meaningful output. 