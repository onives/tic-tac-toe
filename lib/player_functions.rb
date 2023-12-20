def get_player_input(input, player, board=Array.new(3){Array.new(3, "_")})
    puts "Player #{player}, enter your placeholder in format num1, num2"
    input = input.gets.chomp

    row, col = input.split(',').map(&:to_i)

    #TODO Move the call to make_move outside of this function
    make_move(row, col, player, board)
end

def make_move(row, col, player, board=Array.new(3){Array.new(3, "_")})
    if board[row][col] == "_"
        board[row][col] = player
    else
        false
    end
end

def switch_player(player)
    if player == "X"
        "O"
    elsif player == "O"
        "X"
    end
end
