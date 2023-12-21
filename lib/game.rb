require 'player.rb'
require 'stringio'

class Game

    def initialize(board: Board.new, player: Player.new('X'), input: StringIO.new("0,0\n"), output: StringIO.new)
        @board = board
        @player = player
        @input = input
        @output = output
        
    end

    def switch_player
    end

    def play_game
        @board.display_board(@output)
        row, col = @player.get_player_input(@input, @output)
        @board.make_move(row, col, @player.player)
        

    end

end


# display board
# request player for input
# take player's input 
# update the board for with player's letter
#check for winner
# switch players

# repeat 1-5