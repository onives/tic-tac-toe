class Player 

    def initialize(player)
        @player = player
    end

    def get_player_input(input, output)
        output.puts "Player #{@player}, enter your placeholder in format num1, num2"
        input = input.gets.chomp
        row, col = input.split(',').map(&:to_i)
    end
    def player
        @player
    end

end