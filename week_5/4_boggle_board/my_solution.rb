# U2.W5: A Nested Array to Model a Boggle Board

# I worked on this challenge [by myself].

boggle_board = [["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]]


# Part 1: Access multiple elements of a nested array

# Pseudocode
# 1) Create a new method 'create_word' that take two arguments, (board, *coords)
#    - the * indicates that there may be more than 1 (coords) parameter
#    even though you enter the coords as CSVs, the coords variable will return a 
#    multi-dimensional array
# 2) Iterate over your coords array using .map and create a new array where each element
#    is a board space at those coordinates
# 3) use the .join method to make your array into a full word. 

# Initial Solution

  def create_word(board, *coords)
  	# puts coords
  	# puts coords.is_a?(Array)
    coords.map { |coord| board[coord.first][coord.last]}.join("")
  end

	

puts create_word(boggle_board, [2,1], [1,1], [1,2], [0,3])  #=> returns "code"  
puts create_word(boggle_board, [0,1], [0,2], [1,2])  #=> returns "rad"
puts create_word(boggle_board, [1,3], [2,3], [3,3], [3,2]) # => returns "trek"
puts create_word(boggle_board, [3,0], [3,1], [3,2], [3,3]) # => returns "take"
puts create_word(boggle_board, [0,1], [0,2], [1,3], [0,3]) # => returns "rate"
puts create_word(boggle_board, [2,2], [3,1], [3,0], [2,0]) # => returns "late"

# Refactored Solution

def create_word(board, *coords)
    coords.map { |x,y| board[x][y]}.join("")
  end

# DRIVER TESTS GO BELOW THIS LINE

puts boggle_board[0][1] == "r"  
puts boggle_board[2][1] == "c" 
puts boggle_board[3][3] == "e" 
puts create_word(boggle_board, [2,2], [3,1], [3,0], [2,0]) == "late"
puts create_word(boggle_board, [0,1], [0,2], [1,3], [0,3]) == "rate"


# Reflection 

# I threw some puts statements into the original solution becuase I wasn't sure what type of
# object 'coords' was going to be. We have the option to pass multiple arrays to the coords
# parameter, but we aren't acutally passing it an array of arrays. Using the .map function
# indicated that coords was an array, and sure enough - coords is a multi-dimensional array
# when the method is passed multiple arrays. 

# I re-factored the block of the .map function so it made more sense to me. using .first and .last
# obviously works, but there are only two coords to begin with. Using first and last makes
# more sense when there is a long list. I chose instead to use |x,y|, which is 
# indicative of a coordinate plane. 

#-------------------------------------------------------------------------------

# Part 2: Write a method that takes a row number and returns all the elements in the row.  

# Pseudocode

# Initial Solution


# Refactored Solution


# DRIVER TESTS GO BELOW THIS LINE


# Reflection 



#-------------------------------------------------------------------------------

# Part 3: Now write a method that takes a column number and returns all the elements in the column.

# Pseudocode

# Initial Solution


# Refactored Solution


# DRIVER TESTS GO BELOW THIS LINE


# Reflection 