require_relative 'tic_tac_toe.rb'

def get_player_input(output, input)
    player = 'X'

    puts "enter your placeholder in format num1, num2"
    input = input.gets.chomp
    output.puts input

    row = input.split(",")[0].to_i
    col = input.split(",")[1].to_i

    record_player_input(row, col, player)
end

def record_player_input(row, col, player)
    board = [['_', '_', '_'],['_', '_', '_'], ['_', '_', '_']]
    board[row][col] = player
    display_board(output, board)
end
