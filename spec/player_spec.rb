require './lib/player.rb'
require './lib/board.rb'
require 'stringio'

describe Player do
    describe "#get_player_input" do 
        let(:subject){Player.new}
        let(:board){Board.new}
        it "should get player X's input" do
            input = StringIO.new("1,1\n")
            result = subject.get_player_input(input, "X", board)
            expected = [1, 1]

            expect(result).to eq(expected)
        end
    end
end