# frozen_string_literal: true

# tic-tac-toe
class Tic_Tac_Toe
  attr_accessor :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  # checks if the board has any winning combination
  def game_over?(board)
    winning_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # Columns
      [0, 4, 8], [2, 4, 6] # Diagonals
    ]

    winning_combinations.each do |combination|
      marks = combination.map { |index| board[index] }
      return true if marks.uniq.length == 1 && marks[0] != '' # Check if all marks are the same and not empty
    end

    false # No winning pattern found
  end

  # place's given mark at the given position on board
  def place_mark(location, mark)
    board[location - 1] = mark
  end

  # displays the board 
  def display_board
    b = @board
    output = "
    #{b[0]} | #{b[1]} | #{b[2]}
    ---------
    #{b[3]} | #{b[4]} | #{b[5]}
    ---------
    #{b[6]} | #{b[7]} | #{b[8]}
    "
    puts output
  end
end