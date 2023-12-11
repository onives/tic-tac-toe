require 'stringio'

def display_board(console, board)
    $stdout = console
    board.each do |row|
        puts row.join(" ")
    end
end


describe 'display_board' do
    it 'displays the board given output console' do
      console = StringIO.new
      display_board(console, [['X', '_', '_'],['_', '_', '_'], ['_', '_', 'X']])
      expected = "X _ _\n" +
                 "_ _ _\n" +
                 "_ _ X\n"
      expect(console.string).to eq(expected)
    end

    it 'displays board with O placed' do
        console = StringIO.new
        display_board(console, [['X', '_', '_'],['_', 'O', '_'], ['_', '_', 'X']])

        expected = "X _ _\n" +
                   "_ O _\n" +
                   "_ _ X\n"

        expect(console.string).to eq(expected)
    end
    it 'displays board with more characters placed' do
        console = StringIO.new
        display_board(console, [['X', 'O', '_'],['O', 'O', '_'], ['X', '_', 'X']])

        expected = "X O _\n" +
                   "O O _\n" +
                   "X _ X\n"

        expect(console.string).to eq(expected)
    end
end

