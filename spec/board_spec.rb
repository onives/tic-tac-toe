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
        
        # pending "Fill in tests from earlier find_winner implementation"
    end

    describe "#game_over?" do
        it "returns false, when no players have placed letters" do
            subject = Board.new
            expect(subject.game_over?).to eql(false)
        end

        it "returns true when the board is full" do
            subject = Board.new
            subject.make_move(0, 0, "X")
            subject.make_move(0, 1, "X")
            subject.make_move(0, 2, "X")
            subject.make_move(1, 0, "X")
            subject.make_move(1, 1, "X")
            subject.make_move(1, 2, "X")
            subject.make_move(2, 0, "X")
            subject.make_move(2, 1, "X")
            subject.make_move(2, 2, "X")

            expect(subject.game_over?).to eql(true)
        end
        # pending "returns true if either player has won"
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
    end 
end