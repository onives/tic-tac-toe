class Board
  def initialize()
    @grid = Array.new(3){Array.new(3, "_")}
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
