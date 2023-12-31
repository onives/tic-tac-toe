require './lib/board.rb'
require 'stringio'

describe Board do
    describe "#find_winner" do
        let(:subject){Board.new}
        it 'returns false when, given an empty game board' do
            expect(subject.find_winner).to eql(false)
        end
        it 'returns "X" when, given a board where X claims top row' do
            subject.make_move(0, 0, "X")
            subject.make_move(0, 1, "X")
            subject.make_move(0, 2, "X")

            expect(subject.find_winner).to eql('X')
        end
        it 'returns "X" when, given a board where X claims middle row' do
            subject.make_move(1, 0, "X")
            subject.make_move(1, 1, "X")
            subject.make_move(1, 2, "X")

            expect(subject.find_winner).to eql('X')
        end
        it 'returns "X" when, given a board where X claims bottom row' do
            subject.make_move(2, 0, "X")
            subject.make_move(2, 1, "X")
            subject.make_move(2, 2, "X")

            expect(subject.find_winner).to eql('X')
        end
        it 'returns "O" when, given a board where O claims top row' do
            subject.make_move(0, 0, "O")
            subject.make_move(0, 1, "O")
            subject.make_move(0, 2, "O")

            expect(subject.find_winner).to eql('O')
        end
        it 'returns "O" when, given a board where O claims middle row' do
            subject.make_move(1, 0, "O")
            subject.make_move(1, 1, "O")
            subject.make_move(1, 2, "O")

            expect(subject.find_winner).to eql('O')
        end
        it 'returns "O" when, given a board where O claims bottom row' do
            subject.make_move(2, 0, "O")
            subject.make_move(2, 1, "O")
            subject.make_move(2, 2, "O")

            expect(subject.find_winner).to eql('O')
        end
        it 'returns "X" when, given a board where X claims left column' do
            subject.make_move(0, 0, "X")
            subject.make_move(1, 0, "X")
            subject.make_move(2, 0, "X")

            expect(subject.find_winner).to eql('X')
        end
        it 'returns "X" when, given a board where X claims middle column' do
            subject.make_move(0, 1, "X")
            subject.make_move(1, 1, "X")
            subject.make_move(2, 1, "X")

            expect(subject.find_winner).to eql('X')
        end
        it 'returns "X" when, given a board where X claims right column' do
            subject.make_move(0, 2, "X")
            subject.make_move(1, 2, "X")
            subject.make_move(2, 2, "X")

            expect(subject.find_winner).to eql('X')
        end
        it 'returns "O" when, given a board where O claims left column' do
            subject.make_move(0, 0, "O")
            subject.make_move(1, 0, "O")
            subject.make_move(2, 0, "O")

            expect(subject.find_winner).to eql('O')
        end
        it 'returns "O" when, given a board where O claims middle column' do
            subject.make_move(0, 1, "O")
            subject.make_move(1, 1, "O")
            subject.make_move(2, 1, "O")

            expect(subject.find_winner).to eql('O')
        end
        it 'returns "O" when, given a board where O claims right column' do
            subject.make_move(0, 2, "O")
            subject.make_move(1, 2, "O")
            subject.make_move(2, 2, "O")

            expect(subject.find_winner).to eql('O')
        end
        it 'returns "X" when, given a board where X claims the right-left diagonal' do
            subject.make_move(0, 0, "X")
            subject.make_move(1, 1, "X")
            subject.make_move(2, 2, "X")

            expect(subject.find_winner).to eql('X')
        end
        it 'returns "X" when, given a board where X claims the left-right diagonal' do
            subject.make_move(0, 2, "X")
            subject.make_move(1, 1, "X")
            subject.make_move(2, 0, "X")

            expect(subject.find_winner).to eql('X')
        end
        it 'returns "O" when, given a board where O claims the right-left diagonal' do
            subject.make_move(0, 0, "O")
            subject.make_move(1, 1, "O")
            subject.make_move(2, 2, "O")

            expect(subject.find_winner).to eql('O')
        end
        it 'returns "O" when, given a board where O claims the left-right diagonal' do
            subject.make_move(0, 2, "O")
            subject.make_move(1, 1, "O")
            subject.make_move(2, 0, "O")

            expect(subject.find_winner).to eql('O')
        end
        it 'returns :tie when, given a board where neither X nor O wins' do
            subject.make_move(0, 0, "X")
            subject.make_move(0, 1, "O")
            subject.make_move(0, 2, "X")
            subject.make_move(1, 0, "X")
            subject.make_move(1, 1, "O")
            subject.make_move(1, 2, "O")
            subject.make_move(2, 0, "O")
            subject.make_move(2, 1, "X")
            subject.make_move(2, 2, "X")

            expect(subject.find_winner).to eql(:tie)
        end
    end

    describe "#display_board" do 
        let(:subject){Board.new}
        let(:console) {StringIO.new}
        it 'displays the board given output console' do
            subject.make_move(0, 0, "X")
            subject.make_move(2, 2, "X")

            subject.display_board(console)
            
            expected =  "X _ _\n" +
                        "_ _ _\n" +
                        "_ _ X\n"

            expect(console.string).to eq(expected)
        end
        it 'displays board with O placed' do
            subject.make_move(0, 0, "X")
            subject.make_move(1, 1, "O")
            subject.make_move(2, 2, "X")

            subject.display_board(console)
            
            expected =  "X _ _\n" +
                        "_ O _\n" +
                        "_ _ X\n"

            expect(console.string).to eq(expected)
        end
        it 'displays board with more characters placed' do
            subject.make_move(0, 0, "X")
            subject.make_move(1, 1, "O")
            subject.make_move(2, 2, "X")
            subject.make_move(0, 1, "O")
            subject.make_move(1, 0, "O")
            subject.make_move(2, 0, "X")

            subject.display_board(console)
            
            expected =  "X O _\n" +
                        "O O _\n" +
                        "X _ X\n"

            expect(console.string).to eq(expected)
        end
    end 
    describe "#make_move" do 
        let(:subject){Board.new}
        it "should record player X's input in the board" do
            subject.make_move(1, 1, 'X')
            expected = [['_', '_', '_'],['_', 'X', '_'], ['_', '_', '_']]
            expect(subject.get_grid).to eq(expected)
        end
        it "should record player O's input in the board" do
            subject.make_move(0, 0, 'O')
            expected = [['O', '_', '_'],['_', '_', '_'], ['_', '_', '_']]
            expect(subject.get_grid).to eq(expected)
        end
        it "should record second move for X" do
            subject.make_move(0, 0, 'O')
            subject.make_move(0, 1, 'X')
            expected = [['O', 'X', '_'],['_', '_', '_'], ['_', '_', '_']]
            expect(subject.get_grid).to eq(expected)
        end
        it "should return false when move made already has a xter" do
            subject.make_move(0, 0, 'O')
            subject.make_move(0, 1, 'X')
            result = subject.make_move(0, 1, 'O')
            expect(result).to eq(false)
        end

    end
end