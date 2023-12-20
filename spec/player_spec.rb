require './lib/player.rb'
require './lib/board.rb'
require 'stringio'

describe Player do
    describe "#get_player_input" do 
        let(:subject){Player.new('X')}
        let(:board){Board.new}
        it "should get player X's input" do
            input = StringIO.new("1,1\n")
            console = StringIO.new

            result = subject.get_player_input(input, console, board)
            expected = [1, 1]
            expected_output = "Player X, enter your placeholder in format num1, num2\n"
            
            expect(console.string).to eq(expected_output)
            expect(result).to eq(expected)
        end
    end
end