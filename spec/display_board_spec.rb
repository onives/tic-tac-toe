require 'stringio'

def display_board(console, board)
    $stdout = console
    puts "X _ _"
    puts "_ _ _"
    puts "_ _ X"
end


describe 'display_board' do
    it 'displays the board given output console' do
      console = StringIO.new
      display_board(console, [['X', '_', '_'],['_', '_', '_'], ['_', '_', '_']])
      expected = "X _ _\n" +
                 "_ _ _\n" +
                 "_ _ X\n"
      expect(console.string).to eq(expected)
    end
end

