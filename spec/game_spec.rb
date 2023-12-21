require 'stringio'
require './lib/game.rb'
require './lib/board.rb'


describe Game do
    describe "#switch_player" do 
        let(:board){double("board")}
        let(:player){double("player")}
        it "exist" do
            subject = Game.new
            subject.switch_player
        end
    end
    describe "#play_game" do 
        let(:board){double("board")}
        let(:player){double("player")}
        it "should display the game board" do 
            expect(board).to receive(:display_board)
            subject = Game.new(board: board)
            subject.play_game
        end
        it "should request user for input" do 
            expect(player).to receive(:get_player_input)
            subject = Game.new(player: player)
            subject.play_game
        end
    end
end