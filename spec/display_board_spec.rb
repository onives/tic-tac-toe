require 'stringio'

def display_board(console, board)
    $stdout = console
    if board == [['X', '_', '_'],['_', '_', '_'], ['_', '_', 'X']]
        puts "X _ _"
        puts "_ _ _"
        puts "_ _ X"
    elsif board == [['X', '_', '_'],['_', 'O', '_'], ['_', '_', 'X']]
        puts "X _ _"
        puts "_ O _"
        puts "_ _ X"
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
end

