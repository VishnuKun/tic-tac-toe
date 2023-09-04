# frozen_string_literal: true

# spec/tic_tac_toe_spec.rb

require './lib/tic_tac_toe'

describe Tic_Tac_Toe do
  
  describe '#game_over?' do
    subject(:game) { described_class.new }
    context 'when board reads X X X across the top row'
    it 'should return true' do
      board =       board = [['X', 'X', 'X'], ['O', 'O', ' '], [' ', ' ', ' ']]
      solution = game.game_over?(board)
      expect(solution).to be true
    end

    context 'when board reads X X X diagonally(from left to right)' do
      it 'should return true' do
        board =       board = ['X', ' ', ' ',   'O', 'X', ' ',    ' ', ' ', 'X']
        solution = game.game_over?(board)
        expect(solution).to be true
      end
    end

    context 'when board reads X X X across the middle column' do
      it 'should return true' do
        board =       board = ['0', 'X', 'X',   'O', 'X', 'O',    ' ', 'X', ' ']
        solution = game.game_over?(board)
        expect(solution).to be true
      end
    end
    
    context 'when board is filled with no winning match' do
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
    subject(:game) { described_class.new }
    context 'when given message to mark on center' do 
      it 'should mark on boards center' do
        position = 5
        board = game.instance_variable_get(:@board)
        center = board[4]
        expect(center).to eq('X')
        game.place_mark(position)
      end
    end
  end

  describe '#display_board' do
    subject(:game_input) { described_class.new }
    context 'when given message' do 
      before do 
        solution = "
        1 | 2 | 3
        ---------
        4 | 5 | 6
        ---------
        7 | 8 | 9
        ";
        allow(game_input).to receive(:display_board).and_return(solution)
      end

      it 'should display the board' do
        solution = "
        1 | 2 | 3
        ---------
        4 | 5 | 6
        ---------
        7 | 8 | 9
        ";
        expect(game_input).to receive(:puts).with(solution)
        game_input.display_board
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
