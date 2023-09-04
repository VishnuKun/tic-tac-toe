# frozen_string_literal: true

# spec/tic_tac_toe_spec.rb

require './lib/tic_tac_toe'

describe Tic_Tac_Toe do
  
  describe '#game_over?' do
    context 'when board reads X X X across the top row'
    subject(:game) { described_class.new }
    it 'should return true' do
      board =       board = [['X', 'X', 'X'], ['O', 'O', ' '], [' ', ' ', ' ']]
      solution = game.game_over?(board)
      expect(solution).to be true
    end

    context 'when board reads X X X diagonally(from left to right)' do
      subject(:game) { described_class.new }
      it 'should return true' do
        board =       board = ['X', ' ', ' ',   'O', 'X', ' ',    ' ', ' ', 'X']
        solution = game.game_over?(board)
        expect(solution).to be true
      end
    end

    context 'when board reads X X X across the middle column' do
      subject(:game) { described_class.new }
      it 'should return true' do
        board =       board = ['0', 'X', 'X',   'O', 'X', 'O',    ' ', 'X', ' ']
        solution = game.game_over?(board)
        expect(solution).to be true
      end
    end
    
    context 'when board is filled with no winning match' do
      subject(:game) { described_class.new }
      it 'should return false for draw' do
        board =       board = ['O', 'X', 'X',   'X', 'X', 'O',    'O', 'O', 'X']
        solution = game.game_over?(board)
        expect(solution).to be false
      end
    end
    
  end

  # Test each of your critical methods to make sure they function properly and handle edge cases.

  # critical methods -

  describe '#place_mark' do
    context 'when given message to mark on center' do 
      subject(:game) { described_class.new }
      it 'should mark on boards center' do
        expect(result).to eq('X')
      end
    end
  end

  describe '#display_board' do
    context 'when given message' do 
      it 'should display the board' do
      end
    end
  end

  describe '#get_input' do 
    context 'when given message' do
      it 'should receive the input' do
      end
    end
  end
  
  describe '#verify_turn' do
    context 'when given number between 0 and 2' do
      it 'should returns valid number' do
      end
    end

    context 'when given invalid input' do 
      it 'should returns error message' do
      end
    end
  end

  # Use mocks/doubles to isolate methods to make sure that they’re sending back the right outputs.
end
