require_relative 'tic_tac_toe.rb'

def get_player_input(input, player, board=Array.new(3){Array.new(3, "_")})
    puts "Player #{player}, enter your placeholder in format num1, num2"
    input = input.gets.chomp

    row, col = input.split(',').map(&:to_i)

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

# play_game(board, display_board, find_winner, get_player_input, ...)

def play_game()
    board = [['_', '_', '_'],['_', 'X', '_'], ['_', '_', '_']]
    display_board($stdout, board)
end