require './lib/board_functions.rb'
require 'stringio'

describe '#find_winner' do
  it 'returns false when, given an empty game board' do
    board = [
      ['-', '-', '-'],
      ['-', '-', '-'],
      ['-', '-', '-']
    ]

    expect(find_winner(board)).to eql(false)
  end

  it 'returns "X" when, given a board where X claims the top row' do
    board = [
      ['X', 'X', 'X'],
      ['-', '-', '-'],
      ['-', '-', '-']
    ]

    expect(find_winner(board)).to eql('X')
  end
  it 'returns "X" when, given a board where X claims the middle row' do
    board = [
      ['-', '-', '-'],
      ['X', 'X', 'X'],
      ['-', '-', '-']
    ]
    expect(find_winner(board)).to eql('X')
  end
  it 'returns "X" when, given a board where X claims the bottom row' do
    board = [
      ['-', '-', '-'],
      ['-', '-', '-'],
      ['X', 'X', 'X']
    ]

    expect(find_winner(board)).to eql('X')
  end
  it 'returns "O" when, given a board where O claims the top row' do
    board = [
      ['O', 'O', 'O'],
      ['-', '-', '-'],
      ['-', '-', '-']
    ]

    expect(find_winner(board)).to eql('O')
  end
  it 'returns "O" when, given a board where O claims the middle row' do
    board = [
      ['-', '-', '-'],
      ['O', 'O', 'O'],
      ['-', '-', '-']
    ]

    expect(find_winner(board)).to eql('O')
  end
  it 'returns "O" when, given a board where O claims the bottom row' do
    board = [
      ['-', '-', '-'],
      ['-', '-', '-'],
      ['O', 'O', 'O']
    ]

    expect(find_winner(board)).to eql('O')
  end
  it 'returns "X" when, given a board where X claims the top column' do
    board = [
      ['X', '-', '-'],
      ['X', '-', '-'],
      ['X', '-', '-']
    ]

    expect(find_winner(board)).to eql('X')
  end
  it 'returns "X" when, given a board where X claims the middle column' do
    board = [
      ['-', 'X', '-'],
      ['-', 'X', '-'],
      ['-', 'X', '-']
    ]
    expect(find_winner(board)).to eql('X')
  end
  it 'returns "X" when, given a board where X claims the bottom column' do
    board = [
      ['-', '-', 'X'],
      ['-', '-', 'X'],
      ['-', '-', 'X']
    ]

    expect(find_winner(board)).to eql('X')
  end
  it 'returns "O" when, given a board where O claims the top column' do
    board = [
        ['O', '-', '-'],
        ['O', '-', '-'],
        ['O', '-', '-']
    ]

    expect(find_winner(board)).to eql('O')
  end
  it 'returns "O" when, given a board where O claims the middle column' do
    board = [
      ['-', 'O', '-'],
      ['-', 'O', '-'],
      ['-', 'O', '-']
    ]
    expect(find_winner(board)).to eql('O')
  end
  it 'returns "X" when, given a board where X claims the righ-left diagonal' do
    board = [
      ['X', '-', '-'],
      ['-', 'X', '-'],
      ['-', '-', 'X']
    ]
    expect(find_winner(board)).to eql('X')
  end
  it 'returns "X" when, given a board where X claims the left-right diagonal' do
    board = [
      ['-', '-', 'X'],
      ['-', 'X', '-'],
      ['X', '-', '-']
    ]
    expect(find_winner(board)).to eql('X')
  end
  it 'returns "O" when, given a board where O claims the righ-left diagonal' do
    board = [
      ['O', '-', '-'],
      ['-', 'O', '-'],
      ['-', '-', 'O']
    ]
    expect(find_winner(board)).to eql('O')
  end
  it 'returns "O" when, given a board where O claims the left-right diagonal' do
    board = [
      ['-', '-', 'O'],
      ['-', 'O', '-'],
      ['O', '-', '-']
    ]
    expect(find_winner(board)).to eql('O')
  end
  it 'returns :tie when, given a board where neither X nor O wins' do
    board = [
      ['X', 'O', 'X'],
      ['X', 'O', 'O'],
      ['O', 'X', 'X']
    ]
    expect(find_winner(board)).to eql(:tie)
  end
end


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

