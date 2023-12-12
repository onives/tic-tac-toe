require './lib/get_player_input.rb'
require 'stringio'


describe "#get_user_input" do
    let(:output) {StringIO.new}
    it "should take player's input" do
        input = StringIO.new("1,1\n")
        get_player_input(output, input)
        expected = "1,1\n"
        expect(output.string.lines[0]).to eq(expected)
    end
    it "should record player X's input in the board" do
        input = StringIO.new("1,1\n")
        get_player_input(output, input)
        expected =  "_ _ _\n" +
                    "_ X _\n" +
                    "_ _ _\n"
        expect(output.string.lines[1..-1].join("")).to eq(expected)
    end
    # it "should record player O's input in the board" do
    #     input = StringIO.new("1,1\n")
    #     get_player_input(output, input)
    #     expected =  "O _ _\n" +
    #                 "_ X _\n" +
    #                 "_ _ _\n"
    #     expect(output.string.lines[1..-1].join("")).to eq(expected)
    # end
end 

