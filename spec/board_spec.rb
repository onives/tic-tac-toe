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
      expect(subject.game_over?).to eql(true)
    end
  end
end
