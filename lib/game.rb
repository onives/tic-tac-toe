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
        loop do
            @board.display_board(@output)
            row, col = current_player.get_player_input(@input, @output)
            if @board.make_move(row, col, current_player.player)
                winner = @board.find_winner
                if winner == 'X' or winner == 'O'
                    break
                elsif winner == :tie
                    break
                else
                    switch_player
                end
            end
        end
    end

    private
    def current_player
        @players[@current_player_index]
    end

    def switch_player
        if @current_player_index == 0
            @current_player_index = 1
        elsif @current_player_index == 1
            @current_player_index = 0
        end
        
    end

end