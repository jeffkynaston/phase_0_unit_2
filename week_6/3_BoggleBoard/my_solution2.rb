# U2.W6: Create a BoggleBoard Class


# I worked on this challenge [by myself, with: ].


# 2. Pseudocode



# 3. Initial Solution
class BoggleBoard
  
  def initialize(board)
    @boggle_board = board
  end
  
  def create_word(*coords)
    coords.map { |coord| @boggle_board[coord.first][coord.last]}.join("")
  end 
    #your code here
  def get_row(row)
   create_word([row,0], [row,1], [row,2], [row,3]).split("")
  end
  
  def get_col(column)
    create_word([0,column], [1,column], [2,column], [3,column]).split("")
  end

  def get_row(row)
    return @boggle_board[row]
  end

  def get_col(col)
    column = Array.new
    @boggle_board.each { |row| column.push(row[col])}
    return column
  end

    def get_diagonal(x,y)
    # requires 2 coordinates entered to define the diagonal
    # accepts (0,0),(0,3)(3,0)(3,3)
    num = @boggle_board.length-1
    unless (x == 0 && y == 0) || (x == 0 && y == num) || (x == num && y == 0) || (x == num && y == num)
      raise ArgumentError.new ("Enter a valid diagonal: (0,0),(0,#{num})(#{num},0)(#{num},#{num})") 
    else
      diagonal = Array.new
        case x+y
        when 0
          @boggle_board.each do |obj|
            diagonal.push(@boggle_board[x][y])
            x += 1; y += 1
          end
        when 3
          if x == 0
            @boggle_board.each do |obj|
              diagonal.push(@boggle_board[x][y])
              x += 1; y -= 1
            end
          else
            @boggle_board.each do |obj|
              diagonal.push(@boggle_board[x][y])
              x -= 1; y += 1
            end
          end
        when 6
          @boggle_board.each do |obj|
            diagonal.push(@boggle_board[x][y])
            x -= 1; y -= 1
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
 
boggle_board = BoggleBoard.new(dice_grid)
 
puts "Your boggle board #{boggle_board.instance_variable_get(:@boggle_board)}" #:looking for symbol
puts "Your word is #{boggle_board.create_word([1,2], [1,1], [2,1], [3,2])}"
puts "Your row is #{boggle_board.get_row(1)}"
puts "Your column is #{boggle_board.get_col(2)}"
puts "Your diagonal is #{boggle_board.get_diagonal(3,3)}"





# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE
# create driver test code to retrieve a value at a coordinate here:
# implement tests for each of the methods here:


# 5. Reflection 