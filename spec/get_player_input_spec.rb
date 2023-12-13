require './lib/get_player_input.rb'
require 'stringio'


describe "#get_user_input" do
    let(:board){Array.new(3){Array.new(3, "_")}}
    it "should record player X's input in the board" do
        input = StringIO.new("1,1\n")
        get_player_input(input, "X", board)
        expected = [['_', '_', '_'],['_', 'X', '_'], ['_', '_', '_']]
        expect(board).to eq(expected)
    end
    it "should record player O's input in the board" do
        input = StringIO.new("0,0\n")
        get_player_input(input, "O", board)
        expected =  [['O', '_', '_'],['_', '_', '_'], ['_', '_', '_']]
        expect(board).to eq(expected)
    end
    it "should record second move for X" do
        input = StringIO.new("0,1\n")
        board = [['O', '_', '_'],['_', '_', '_'], ['_', '_', '_']]
        get_player_input(input, "X", board)
        expected =  [['O', 'X', '_'],['_', '_', '_'], ['_', '_', '_']]
        expect(board).to eq(expected)
    end
    it "should return false when move made already has a xter" do
        input = StringIO.new("0,1\n")
        board = [['O', 'X', '_'],['_', '_', '_'], ['_', '_', '_']]
        expect(get_player_input(input, "O", board)).to eql(false)
    end
end 

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

