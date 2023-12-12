require_relative 'tic_tac_toe.rb'

def get_player_input(output, input, board=[])
    puts "enter your placeholder in format num1, num2"
    input = input.gets.chomp
    output.puts input

    board = [['_', '_', '_'],['_', '_', '_'], ['_', '_', '_']]
    row = input.split(",")[0].to_i
    col = input.split(",")[1].to_i
    board[row][col] = 'X'

    display_board(output, board)
end
