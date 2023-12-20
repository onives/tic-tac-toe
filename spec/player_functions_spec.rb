require './lib/player_functions.rb'
require 'stringio'

describe "#switch player" do
    it "should switch player to O" do
        player = "X"
        result = switch_player(player)
        expect(result).to eql("O")
    end
    it "should switch player to X" do
        player = "O"
        result = switch_player(player)
        expect(result).to eql("X")
    end
end
