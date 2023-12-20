require 'stringio'
require './lib/game.rb'
require './lib/board.rb'


describe Game do
    describe "#switch_player" do 
        let(:board){double("board")}
        it "exist" do
            subject = Game.new(board)
            subject.switch_player
        end
    end
    describe "#play_game" do 
        let(:board){double("board")}
        it "exist" do
            subject = Game.new(board)
            subject.play_game
        end
        it "should display the game board" do 
            subject = Game.new(board)
        end
    end
end