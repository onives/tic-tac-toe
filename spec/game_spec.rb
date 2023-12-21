require 'stringio'
require './lib/game.rb'
require './lib/board.rb'


describe Game do
    describe "#switch_player" do 
        # let(:board){double("board")}
        let(:player){double("player")}
        it "exist" do
            subject = Game.new
            subject.switch_player
        end
    end
    describe "#play_game" do 
        # let(:board){double("board")}
        let(:player){double("player", :player => '', :get_player_input => '')}
        it "should display the game board" do
            board = double("board", :make_move => '')
            expect(board).to receive(:display_board)
            subject = Game.new(board: board, player: player)
            subject.play_game
        end
        it "should request user for input" do 
            board = double("board")
            allow(board).to receive(:display_board)
            allow(board).to receive(:make_move)
            expect(player).to receive(:get_player_input)
            subject = Game.new(player: player, board: board)
            subject.play_game
        end
        it "should update board with player's input" do 
            board = double("board", :display_board => '' )
            allow(player).to receive(:get_player_input){[1, 0]}
            allow(player).to receive(:player){"X"}
            expect(board).to receive(:make_move).with(1, 0, 'X')
            subject = Game.new(board: board, player: player)
            subject.play_game
        end
    end
end