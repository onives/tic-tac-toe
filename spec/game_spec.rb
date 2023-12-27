require 'stringio'
require './lib/game.rb'
require './lib/board.rb'


describe Game do
    describe "#switch_player" do 
        # let(:board){double("board")}
        let(:player){double("player")}
        xit "exist" do
            subject = Game.new
            subject.switch_player
        end
    end
    describe "#play_game" do 
        # let(:board){double("board")}
        let(:input){StringIO.new}
        let(:output){StringIO.new}
        let(:player){double("player", :player => 'X', :get_player_input => '')}
        it "should display the game board" do
            board = double("board", :make_move => '', :find_winner => '')
            expect(board).to receive(:display_board)
            subject = Game.new(board, player, input, output)
            subject.play_game
        end
        it "should request user for input" do 
            board = double("board", :find_winner => '')
            allow(board).to receive(:display_board)
            allow(board).to receive(:make_move)
            expect(player).to receive(:get_player_input)
            subject = Game.new(board, player, input, output)
            subject.play_game
        end
        it "should update board with player's input" do 
            board = double("board", :display_board => '', :find_winner => '' )
            allow(player).to receive(:get_player_input){[1, 0]}
            expect(board).to receive(:make_move).with(1, 0, 'X')
            subject = Game.new(board, player, input, output)
            subject.play_game
        end
        it "should check for winner" do 
            board = double("board", :display_board => '', :make_move => '' )
            expect(board).to receive(:find_winner)

            subject = Game.new(board, player, input, output)
            subject.play_game
        end
        xit "should be able to switch players" do 
            board = double("board", :display_board => '' )

            allow(player).to receive(:get_player_input){[0, 1]}
            allow(player).to receive(:get_player_input){[0, 1]}
            allow(player).to receive(:get_player_input){[0, 2]}

            allow(board).to receive(:make_move).with(0, 0, 'X')
            allow(board).to receive(:make_move).with(0, 1, 'X')
            allow(board).to receive(:make_move).with(0, 2, 'X')

            expect(board).to receive(:find_winner){'X'}

            subject = Game.new(board, player, input, output)
            subject.play_game
        end
    end
end