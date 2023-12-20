require './lib/player.rb'
require './lib/board.rb'
require 'stringio'

describe Player do
    describe "#get_player_input" do 
        let(:subject){Player.new('X')}
        let(:board){Board.new}
        let(:console){StringIO.new}
        let(:input){StringIO.new("1,1\n")}

        it "should get player X's input" do
            result = subject.get_player_input(input, console, board)
            expected = [1, 1]
    
            expect(result).to eq(expected)
        end
        it "should prompt player for input" do
            result = subject.get_player_input(input, console, board)
            expected_output = "Player X, enter your placeholder in format num1, num2\n"
            
            expect(console.string).to eq(expected_output)
        end
    end
end