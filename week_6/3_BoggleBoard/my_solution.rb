# U2.W6: Create a BoggleBoard Class


# I worked on this challenge [by myself].


# 2. Pseudocode
# 1) Define an initialize method that takes one argument (board)
# 2) Store this argument in an instance variable @board
# 3) Raise argument error if the argument passed is not an array
# 4) define method create_word that takes one parameter of dynamic length, (*coords)
# 5) use the map function to iterate over (*coords) note: coords will be an array
# 6) return the element at [x][y] for each coord, and join those into a string
# 7) define method get_row that takes one argument (row)
# 8) return that element of the @board array
# 9) define method get_col that takes one argument, (col)
# 10) create a new empty array, column
# 11) iterate over @board using .each
# 12) for each element in @board, push that row's element at index (col) to the column array



# 3. Initial Solution

class BoggleBoard

  def initialize (board)
    @board = board
    raise ArgumentError.new ("You did not enter a valid board!") unless @board.is_a?(Array) == true
  end

  def create_word(*coords)
  	# puts coords
  	# puts coords.is_a?(Array)
    coords.map { |x,y| @board[x][y]}.join("")
  end

  def get_row(row)
    return @board[row]
  end

  def get_col(col)
    column = Array.new
    @board.each { |row| column.push(row[col])}
    return column
  end

  def get_diagonal(x,y)
  	# requires 2 coordinates entered to define the diagonal
  	# accepts (0,0),(0,3)(3,0)(3,3)
  	num = @board.length-1
  	unless (x == 0 && y == 0) || (x == 0 && y == 3) || (x == 3 && y == 0) || (x == 3 && y == 3)
  		raise ArgumentError.new ("Enter a valid diagonal: (0,0),(0,#{num})(#{num},0)(#{num},#{num})") 
  	else
	  	diagonal = Array.new
	  		case x+y
		  	when 0
			  	@board.each do |obj|
			  		diagonal.push(@board[x][y])
			  		x += 1; y += 1
			  	end
		 	  when num
		 	  	if x == 0
			 	  	@board.each do |obj|
				  		diagonal.push(@board[x][y])
				  		x += 1;	y -= 1
				  	end
		  		else
		  	 		@board.each do |obj|
				  		diagonal.push(@board[x][y])
				  		x -= 1;	y += 1
			  		end
		  		end
		  	when x*2
		  		@board.each do |obj|
			  		diagonal.push(@board[x][y])
			  		x -= 1;	y -= 1
		  		end
		  	end	
			# end
  		return diagonal
  	end

  end
end


dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]
 
# => boggle board holds the multi-dimensional array, dice_grid, by 
# storing it in an instance variable, @board. The variable dice_grid
# is passed through the initialize method via a parameter given when 
# calling BoggleBoard.new
boggle_board = BoggleBoard.new(dice_grid)
 

puts "Row 2: #{boggle_board.get_row(1)}"
puts "Col 2: #{boggle_board.get_col(1)}"
puts "Diag starting at top left: #{boggle_board.get_diagonal(0,0)}"
puts "Diag starting at bottom right: #{boggle_board.get_diagonal(3,3)}"
puts "Diag starting at top right: #{boggle_board.get_diagonal(3,0)}"
puts "Diag starting at bottom left: #{boggle_board.get_diagonal(0,3)}"
# puts "Using classes, your diag: #{boggle_board.get_diagonal(0,2)}"
words = [
boggle_board.create_word([2,1], [1,1], [1,2], [0,3]),  #=> returns "code"  
boggle_board.create_word([0,1], [0,2], [1,2]),  #=> returns "rad"
boggle_board.create_word([1,3], [2,3], [3,3], [3,2]), # => returns "trek"
boggle_board.create_word([3,0], [3,1], [3,2], [3,3]), # => returns "take"
boggle_board.create_word([0,1], [0,2], [1,3], [0,3]), # => returns "rate"
boggle_board.create_word([2,2], [3,1], [3,0], [2,0]), # => returns "late"
]
puts "Jeff's Words: #{words}"


session = [0,1,2,3]
session.each { |i| puts "row #{i+1}: #{boggle_board.get_row(i)}" }
session.each { |i| puts "col #{i+1}: #{boggle_board.get_col(i)}" }

# There are a couple words in the rows and columns:
# => brae - a steep bank or hillside.
# => take


# 4. Refactored Solution

# The original 3 methods in my initial solution are as DRY as I can get them.
# There may be room for some refactoring in my diagonal solution, but 
# I would probably have to change the logic. Instead of doing an entire new 
# diagonal method, I refactored my original one by moving my super long
# argument error method to multiple lines, and moving the +=x and -=y's to 
# one line, separated by a semi-colon




# 1. DRIVER TESTS GO BELOW THIS LINE
# create driver test code to retrieve a value at a coordinate here:
# implement tests for each of the methods here:
def assert
	raise "Assertion Failed!" unless yield
end

assert { boggle_board.create_word([1,2], [1,1], [2,1], [3,2]) == "dock" } # returns "dock"
assert { boggle_board.create_word([1,3], [2,3], [3,3], [3,2]) == "trek" } # returns "trek"
assert { boggle_board.get_diagonal(3,0) == ["t", "c", "d", "e"]}
assert { boggle_board.get_diagonal(0,3) == ["e", "d", "c", "t"]}
assert { boggle_board.get_row(1) == ["i", "o", "d", "t"]}
assert { boggle_board.get_col(1) == ["r", "o", "c", "a"]}
# 5. Reflection 

# Last week when we were doing the boggle challenge I thought, hmm, this would
# work much better as a class. And at the end of last weeks challenge, I actually
# re-wrote the code as a class, so I used that as a starting point for this
# challenge. Most of my work this week was on the assert statements and the
# diagonal method. 

# Compared to our methods last week, re-writing this as a class was more
# simple becuase you no longer have to specify a second argument. Last week,
# in order for my methods to have acecss to the boaggle_board I had to pass
# the board in as a parameter. I noticed that some people solved this issue
# using global variables, but I have always thought it was best to stay 
# away from global varibles. Now, when an object is initialized, the board is
# being passed through and stored in an instance variable, @board, which we 
# can access from any instance method. 