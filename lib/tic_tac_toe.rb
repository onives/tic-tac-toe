def find_winner(board)
    # returns row winner
    board.each do |row|
        row_winner = find_winner_in_line(row)
        if row_winner
            return row_winner
        end
    end

    # returns column winner
    board.transpose.each do |col|
        col_winner = find_winner_in_line(col)
        if col_winner
            return col_winner
        end
    end

    # returns diagonal winner
    diagonal_winner = find_winner_in_diagonal(board)
    if diagonal_winner
        return diagonal_winner
    end

    # check for any unfilled space
    board.each do |row|
        row.each do |col|
            if col == '-'
                return false
            end
        end
    end

    :tie
end

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
