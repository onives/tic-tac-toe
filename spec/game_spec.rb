require 'stringio'
require './lib/game.rb'
require './lib/board.rb'


describe Game do
    describe "#switch_player" do 
        subject {Game.new}
        it "exist" do
            subject.switch_player
        end
    end
    describe "#play_game" do 
        subject {Game.new}
        it "exist" do
            subject.play_game
        end
    end
end