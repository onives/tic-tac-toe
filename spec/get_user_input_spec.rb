require './lib/get_user_input.rb'
require 'stringio'


describe "#get_user_input" do
    let(:output) {StringIO.new}
    it "should take player's input" do
        input = StringIO.new("1,1\n")
        get_user_input(output, input)
        expected = "1,1\n"
        expect(output.string).to eq(expected)
    end
end 
