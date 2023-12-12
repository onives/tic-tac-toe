require_relative 'tic_tac_toe.rb'

def get_player_input(input, player, board=Array.new(3){Array.new(3, "_")})
    puts "enter your placeholder in format num1, num2"
    input = input.gets.chomp

    row = input.split(",")[0].to_i
    col = input.split(",")[1].to_i

    board[row][col] = player
end

def switch_player(player)
    if player == "X"
        "O"
    elsif player == "O"
        "X"
    end
end


