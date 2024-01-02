require 'stringio'
require './lib/game.rb'
require './lib/board.rb'

def ideas_for_making_test_doubles_change_behavior_over_time
    #one possible syntax
    allow(board).to receive(:find_winner).and_return false #return false the first time #find_winner is called
    allow(board).to receive(:find_winner).and_return 'X' #return 'X' the second time #find_winner is called

    #another possible syntax
    allow(board).to receive(:find_winner).and_return [false, 'X'] #return false the first time #find_winner is called and return 'X' the second time it is called
end

describe Game do
    describe "#play_game" do 
        # let(:board){double("board")}
        let(:input){StringIO.new}
        let(:output){StringIO.new}
        let(:playerX){double("player_x", :player => 'X', :get_player_input => '')}
        let(:playerO){double("player_o", :player => 'O', :get_player_input => '')}
        it "should display the game board" do
            board = double("board", :make_move => '', :find_winner => 'X')
            expect(board).to receive(:display_board)
            subject = Game.new(board, [playerX, playerO], input, output)
            subject.play_game
        end
        it "should request user for input" do 
            board = double("board", :display_board => '', :make_move => '', :find_winner => 'X')
            expect(playerX).to receive(:get_player_input)
            subject = Game.new(board, [playerX, playerO], input, output)
            subject.play_game
        end
        it "should update board with player's input" do 
            board = double("board", :display_board => '', :find_winner => 'X', :make_move => '')
            allow(playerX).to receive(:get_player_input){[1, 0]}
            expect(board).to receive(:make_move).with(1, 0, 'X')
            subject = Game.new(board, [playerX, playerO], input, output)
            subject.play_game
        end
        it "should check for winner" do 
            board = double("board", :display_board => '', :make_move => '', :find_winner => 'X' )
            expect(board).to receive(:find_winner)

            subject = Game.new(board, [playerX, playerO], input, output)
            subject.play_game
        end
        it "should be able to switch players" do 
            board = double("board", :display_board => '', :make_move => '' )
            allow(board).to receive(:find_winner).and_return(false, 'X')
            expect(playerX).to receive(:get_player_input)
            expect(playerO).to receive(:get_player_input)
            subject = Game.new(board, [playerX, playerO], input, output)
            subject.play_game
        end
        it "should be able to switch players back to X" do 
            board = double("board", :display_board => '', :make_move => '' )
            allow(board).to receive(:find_winner).and_return(false, false, 'X')
            expect(playerX).to receive(:get_player_input).twice
            expect(playerO).to receive(:get_player_input)
            subject = Game.new(board, [playerX, playerO], input, output)
            subject.play_game
        end
    end
end