require './lib/board.rb'

describe Board do
  describe "#game_over?" do
    it "returns false, when no players have placed letters" do
      subject = Board.new
      expect(subject.game_over?).to eql(false)
    end
  end
end
