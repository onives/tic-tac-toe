require 'stringio'
require './lib/game.rb'
require './lib/board.rb'


describe Game do
    describe "#play_game" do 
        # let(:board){double("board")}
        let(:input){StringIO.new}
        let(:output){StringIO.new}
        let(:playerX){double("player_x", :player => 'X', :get_player_input => '')}
        let(:playerO){double("player_o", :player => 'O', :get_player_input => '')}
        it "should display the game board" do
            board = double("board", :make_move => '', :find_winner => '')
            expect(board).to receive(:display_board)
            subject = Game.new(board, [playerX, playerO], input, output)
            subject.play_game
        end
        it "should request user for input" do 
            board = double("board", :find_winner => '')
            allow(board).to receive(:display_board)
            allow(board).to receive(:make_move)
            expect(playerX).to receive(:get_player_input)
            subject = Game.new(board, [playerX, playerO], input, output)
            subject.play_game
        end
        it "should update board with player's input" do 
            board = double("board", :display_board => '', :find_winner => '' )
            allow(playerX).to receive(:get_player_input){[1, 0]}
            expect(board).to receive(:make_move).with(1, 0, 'X')
            subject = Game.new(board, [playerX, playerO], input, output)
            subject.play_game
        end
        it "should check for winner" do 
            board = double("board", :display_board => '', :make_move => '' )
            expect(board).to receive(:find_winner)

            subject = Game.new(board, [playerX, playerO], input, output)
            subject.play_game
        end
        it "should be able to switch players" do 
            board = double("board", :display_board => '', :make_move => '', :find_winner => '' )
            expect(playerX).to receive(:get_player_input)
            expect(playerO).to receive(:get_player_input)
            subject = Game.new(board, [playerX, playerO], input, output)
            subject.play_game
        end
    end
end