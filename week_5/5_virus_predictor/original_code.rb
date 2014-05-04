# U2.W5: Virus Predictor

# I worked on this challenge [by myself, with: ].

# EXPLANATION OF require_relative
# require_relative loads another file into the current ruby file. 
# In comparison with the normal require statement, require_relative will
# look for the specific file in a directory relative to the current 
# directory. 

# ANALYZE state data
# I think that state data is using a hash witin a hash. In the first hash, the state
# name is the key, and the second hash is the value. In the scond hash, the metric
# names are the keys, and the metric values are the values. 

#
require_relative 'state_data'

class VirusPredictor

# Initliazes an instance of the virus predictor class and defines instance variables
  def initialize(state_of_origin, population_density, population, region, regional_spread)
    @state = state_of_origin
    @population = population
    @population_density = population_density
    @region = region
    @next_region = regional_spread
  end

# Calls predicted deaths method and spread of deaths method to generate output for the user
  def virus_effects  #HINT: What is the SCOPE of instance variables?
    predicted_deaths
    speed_of_spread
  end

  private  #what is this?  what happens if it were cut and pasted above the virus_effects method

# Checks population density and returns a statement regarding the predicted number of deaths
  def predicted_deaths
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
    else 
      number_of_deaths = (@population * 0.05).floor
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

# Checks population density and returns a statement regarding he predicted speed of spread
  def speed_of_spread #in months
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else 
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#======================================================================

# Create a Report for all 50 states

STATE_DATA.each_key do |key| 
  VirusPredictor.new(key, STATE_DATA[key][:population_density], STATE_DATA[key][:population], STATE_DATA[key][:region], STATE_DATA[key][:regional_spread]).virus_effects
end


#=======================================================================

# REFACTOR 
# Instance variables are available to any method within a class, so passing them through as
# arguments to the method is redundant. You can access them even without these parameters. 

# PRIVATE METHODS
# Private methods are available only to other methods within the object. You cannot 
# explicitly call a private method on an instance of an object. If you were to put 
# the private method call above virus effects, the code would not run - you would not be
# able to call it. 

class VirusPredictor

# Initliazes an instance of the virus predictor class and defines instance variables
  def initialize(state_of_origin, population_density, population, region, regional_spread)
    @state = state_of_origin
    @population = population
    @population_density = population_density
    @region = region
    @next_region = regional_spread
  end

# Calls predicted deaths method and spread of deaths method to generate output for the user
  def virus_effects  #HINT: What is the SCOPE of instance variables?
    predicted_deaths
    speed_of_spread
  end

  private  #what is this?  what happens if it were cut and pasted above the virus_effects method

# Checks population density and returns a statement regarding the predicted number of deaths
  def predicted_deaths
    number_of_deaths = (@population * case @population_density
    when (200..1000)
      0.4
    when (150...200)
      0.3
    when (100...150)
      0.2
    when (50...100)
      0.1
    else 
      0.05
    end).floor

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

# Checks population density and returns a statement regarding he predicted speed of spread
  def speed_of_spread #in months
    
    speed = case @population_density
    when (200..1000)
      0.5
    when (150...200)
      1
    when (100...150)
      1.5
    when (50...100)
      2
    else 
      2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population], STATE_DATA["Alabama"][:region], STATE_DATA["Alabama"][:regional_spread]) 
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population], STATE_DATA["New Jersey"][:region], STATE_DATA["New Jersey"][:regional_spread]) 
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population], STATE_DATA["California"][:region], STATE_DATA["California"][:regional_spread]) 
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population], STATE_DATA["Alaska"][:region], STATE_DATA["Alaska"][:regional_spread]) 
alaska.virus_effects
