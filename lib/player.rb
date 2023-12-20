class Player 

    def get_player_input(input, player, board)
        puts "Player #{player}, enter your placeholder in format num1, num2"
        input = input.gets.chomp
        row, col = input.split(',').map(&:to_i)
    end

    def make_move
    end
end