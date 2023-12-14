require './lib/board.rb'

describe Board do
  describe "#game_over?" do
    it "returns false, when no players have placed letters" do
      subject = Board.new
      expect(subject.game_over?).to eql(false)
    end

    it "returns true when the board is full" do
      subject = Board.new
      subject.place_letter("X", 0, 0)
      subject.place_letter("X", 0, 1)
      subject.place_letter("X", 0, 2)
      subject.place_letter("X", 1, 0)
      subject.place_letter("X", 1, 1)
      subject.place_letter("X", 1, 2)
      subject.place_letter("X", 2, 0)
      subject.place_letter("X", 2, 1)
      subject.place_letter("X", 2, 2)
      
      expect(subject.game_over?).to eql(true)
    end
  end
end
