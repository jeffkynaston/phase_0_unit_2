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

	
words = [
create_word(boggle_board, [2,1], [1,1], [1,2], [0,3]),  #=> returns "code"  
create_word(boggle_board, [0,1], [0,2], [1,2]),  #=> returns "rad"
create_word(boggle_board, [1,3], [2,3], [3,3], [3,2]), # => returns "trek"
create_word(boggle_board, [3,0], [3,1], [3,2], [3,3]), # => returns "take"
create_word(boggle_board, [0,1], [0,2], [1,3], [0,3]), # => returns "rate"
create_word(boggle_board, [2,2], [3,1], [3,0], [2,0]), # => returns "late"
]
puts "Jeff's Words: #{words}"

# Refactored Solution

def create_word(board, *coords)
    coords.map { |x,y| board[x][y]}.join("")
  end

# DRIVER TESTS GO BELOW THIS LINE
puts "Section 1 Driver Tests:"
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
# 1) Define a method, new row, that takes two arguments (board, row)
# 2) return the (row) element of the (board) array.  
# Initial Solution

def get_row(board, row)
    return board[row]
end

puts "Your Row: #{get_row(boggle_board, 1)}" #=>  ["i", "o", "d", "t"]


# Refactored Solution

# Since each element of the primary board array represents a row, the function
# is very simple - just return that element of the array. This line can't be refactored
# any more. (You could remove return, but I like having it in there)

# DRIVER TESTS GO BELOW THIS LINE

puts method(:get_row).arity == 2
puts get_row(boggle_board, 1)  ==  ["i", "o", "d", "t"]

# Reflection 

# The instructions for get row and get column methods show only one argument - the row/col
# number. This caused a slight issue, becuase my get_row method didn't recognize the variable
# boggle_board. The easiest way to fix this was to add an argument to the get_row function, and pass
# the board into it. There are othr ways to achive this too - and the most scalable way to
# do this is to make the entire thing into a class. In the class, you would create an instance
# variable of the board object that you could use with any function. At the bottom of this challenge,
# I re-did the functions in this format. 

#-------------------------------------------------------------------------------

# Part 3: Now write a method that takes a column number and returns all the elements in the column.

# Pseudocode

# Initial Solution
# 1) Define a new method, get_col, with two arguments (board, col)
# 2) Create an empty array, column
# 3) loop through board using the each_with_index function
# 4) for each elment in the borad array, push letter number (col) of row number (i) to column
# 5) Return column 

def get_col(board, col)
    column = []
    board.each_with_index { |obj,i| column.push(board[i][col])}
    return column
end

puts "Your Column: #{get_col(boggle_board,1)}"  #=>  ["r", "o", "c", "a"]


# Refactored Solution

def get_col(board, col)
    column = []
    board.each { |row| column.push(row[col])}
    return column
end

puts "Your Column: #{get_col(boggle_board,1)}"  #=>  ["r", "o", "c", "a"]



# DRIVER TESTS GO BELOW THIS LINE

puts method(:get_col).arity == 2
puts get_row(boggle_board, 1)  ==  ["r", "o", "c", "a"]


# Reflection

# I recently used each_with_index for the first time, so I wanted to practice using
# it again and this method seemed like a good fit. In this solution, I'm looping through
# the board array and passing each element through a block of code. Using each_with_index
# gives me access to the index number of the element, which is represented in the form of
# an integer. Since this index number corresponds to the row number in our boggle board,
# I can use it with my col number to reference a specific spot on the board. Looping
# Through and calling the same col number for each row number gives us a full column. 

# Once I finished my initial solution, it was clear that this could be accomplished without
# the explicit use of an index integer. Previously I had used each_with_index in order to
# manipulate which elements in the array would be touched by the each loop. In this case, 
# I am looping over every element in the array, and that funcationality isn't needed. Instead,
# I am simply using the index number to reference a specific spot on the boggle board, and 
# I can reference the actual array element in order to achieve the same thing. 

puts "--------------------------------------------"

class Board

  def initialize (board)
    @board = board
    raise ArgumentError.new ("You did not enter a valid board!") unless @board.is_a?(Array) == true
  end

  def get_row(row)
    return @board[row]
  end

  def get_col(col)
    column = Array.new
    @board.each { |row| column.push(row[col])}
    return column
  end
end

session = Board.new([["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]])
puts "Using classes, your row: #{session.get_row(1)}"
puts "Using classes, your col: #{session.get_col(1)}"

