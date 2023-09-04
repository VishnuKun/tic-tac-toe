# frozen_string_literal: true

# tic-tac-toe
class Tic_Tac_Toe
  attr_accessor :board
  def initialize
    @board = Array.new(9) { |i| i + 1} 
  end

  def game_over?(board)
  end
end