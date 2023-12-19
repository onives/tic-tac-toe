require './lib/board_functions.rb'
require 'stringio'


describe '#display_board' do
  let(:console) {StringIO.new}
  it 'displays the board given output console' do
    display_board(console, [['X', '_', '_'],['_', '_', '_'], ['_', '_', 'X']])
    expected = "X _ _\n" +
               "_ _ _\n" +
               "_ _ X\n"
    expect(console.string).to eq(expected)
  end

  it 'displays board with O placed' do
      display_board(console, [['X', '_', '_'],['_', 'O', '_'], ['_', '_', 'X']])

      expected = "X _ _\n" +
                 "_ O _\n" +
                 "_ _ X\n"

      expect(console.string).to eq(expected)
  end
  it 'displays board with more characters placed' do
      display_board(console, [['X', 'O', '_'],['O', 'O', '_'], ['X', '_', 'X']])

      expected = "X O _\n" +
                 "O O _\n" +
                 "X _ X\n"

      expect(console.string).to eq(expected)
  end
end

