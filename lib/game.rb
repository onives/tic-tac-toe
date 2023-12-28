require 'player.rb'
require 'stringio'

class Game

    def initialize(board, players, input, output)
        @board = board
        @players = players
        @input = input
        @output = output
        @current_player_index = 0
    end

    def play_game
        @board.display_board(@output)
        row, col = current_player.get_player_input(@input, @output)
        @board.make_move(row, col, current_player.player)
        @board.find_winner
        switch_player
        row, col = current_player.get_player_input(@input, @output)
    end

    private
    def current_player
        @players[@current_player_index]
    end

    def switch_player
        @current_player_index = 1
    end

end


# display board
# request player for input
# take player's input 
# update the board for with player's letter
#check for winner
# switch players

# repeat 1-5