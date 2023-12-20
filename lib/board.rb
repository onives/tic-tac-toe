class Board

    def initialize()
        @grid = Array.new(3){Array.new(3, '_')}
    end

    def get_grid
        @grid
    end

    def find_winner()

        # returns row winner
        @grid.each do |row|
            row_winner = find_winner_in_line(row)
            if row_winner
                return row_winner
            end
        end

        # returns column winner
        @grid.transpose.each do |col|
            col_winner = find_winner_in_line(col)
            if col_winner
                return col_winner
            end
        end

        # returns diagonal winner
        diagonal_winner = find_winner_in_diagonal(@grid)
        if diagonal_winner
            return diagonal_winner
        end

        # check for any unfilled space
        @grid.each do |row|
            row.each do |col|
                if col == '_'
                    return false
                end
            end
        end

        :tie
    end

    def display_board(console)
        @grid.each do |row|
            console.puts row.join(" ")
        end
    end

    def game_over?()
        if (@grid[0][0] == "X")
            return true
        end
        false
    end

    def make_move(row, col, player)
        if @grid[row][col] == "_"
            @grid[row][col] = player
        else
            false
        end
    end

    private
    def find_winner_in_line(row)
        if row.all? { |cell| cell == 'X' }
            'X'
        elsif row.all? { |cell| cell == 'O' }
            'O'
        else
            false
        end
    end

    def find_winner_in_diagonal(board)
        diagonal1 = [board[0][0], board[1][1], board[2][2]]
        diagonal2 = [board[0][2], board[1][1], board[2][0]]

        winner_in_line_1 = find_winner_in_line(diagonal1)
        winner_in_line_2 = find_winner_in_line(diagonal2)
        if winner_in_line_1
            return winner_in_line_1
        elsif winner_in_line_2
            return winner_in_line_2
        end
    end

end
