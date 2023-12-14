class Board
  def initialize()
    @grid = Array.new(3){Array.new(3, "_")}
  end

  #TODO: Port code from board_functions::find_winner over to here, changing the board parameter to the @grid instance variable
  def find_winner()
  end

  def game_over?()
    if (@grid[0][0] == "X")
      return true
    end

    false
  end

  def place_letter(letter, row, column)
    @grid[row][column] = letter
  end
end
