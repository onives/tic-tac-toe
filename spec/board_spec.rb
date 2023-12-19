require './lib/board.rb'

describe Board 
    describe "#find_winner" do
        let(:subject){Board.new}
        it 'returns false when, given an empty game board' do
            # subject = Board.new
            expect(subject.find_winner).to eql(false)
        end
        it 'returns "X" when, given a board where X wins' do
            # subject = Board.new
            allow(subject).to receive(:find_winner){'X'}
            expect(subject.find_winner).to eql('X')
        end
        it 'returns "O" when, given a board where X wins' do
            # subject = Board.new
            allow(subject).to receive(:find_winner){'O'}
            expect(subject.find_winner).to eql('O')
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
# end