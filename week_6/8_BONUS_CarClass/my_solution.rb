# U2.W6: Create a Car Class from User Stories


# I worked on this challenge [with: Andrew Koines Jr].


# 2. Pseudocode

# 1) Define the class Car
# 2) Initialize Method - two arguments (model, color)
#    Set instance variable @model = model
#    Set instance variable @color = color
#    Set instance variable @speed
#    Set instance variable @odometer
#    Set instance variable @direction

#  3) Create Drive Method with Arguments (distance, speed)
#     Puts last action at the end of the drive

#  4) Create turn method (direction)



# 3. Initial Solution

class Car
  def initialize(model,color)
    @model=model
    @color=color
    @odometer=0
    @direction=:north
    @location=[0,0]
  end
  
  def drive(distance,speed)
    case @direction
      when :north
        @location[1]+=distance
      when :south
        @location[1]-=distance
      when :east
        @location[0]+=distance
      when :west
        @location[0]-=distance
    end
    @odometer += distance
    puts "You drove #{distance} miles at #{speed} MPH. You've gone #{@odometer} miles."
    puts "Your new location is #{@location} and you are now facing #{@direction}."
  end
  
  def turn(direction)
    @direction = direction.to_sym
    puts "Your new direction is #{direction}."
  end
  
end




# 4. Refactored Solution

# Our solution was already as dry as we could get it. In our drive method,
# we factored out the puts statements and odometer updating from the case statments
# so we didnt' have to repeat that code. 




# 1. DRIVER TESTS GO BELOW THIS LINE
def assert
  raise "Assertion Failed!" unless yield
end

car=Car.new("ford","green")
assert { car.instance_variable_get(:@model) == "ford" }
assert { car.instance_variable_get(:@color) == "green" }
car.drive(0.25, 25)
assert { car.instance_variable_get(:@location)[1] == 0.25 }
car.turn(:east)
assert{ car.instance_variable_get(:@direction) == :east }
car.drive(1.5,35)
assert{ car.instance_variable_get(:@location)[0] == 1.5 }
car.drive(0.25,15)
assert{ car.instance_variable_get(:@location)[0] == 1.75 }
car.turn(:north)
assert{ car.instance_variable_get(:@direction) == :north }
car.drive(1.4,35)
assert{ car.instance_variable_get(:@location)[1] == 1.65 }


# 5. Reflection 

#  Our method handled most of what the user stories were asking for. Adding a current speed
#  for the car at all times would require a lot more work, as well as accellerate and decellerate
#  methods that get called during the drive method. It would definitley be fun to code it out
#  with more complexity, but unfortunately I don't have the time this week!
# 