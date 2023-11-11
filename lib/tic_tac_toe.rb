# frozen_string_literal: true

# tic-tac-toe
class TicTacToe
  attr_accessor :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  # welcomes players and explains game details
  def introduction
    intro = <<-TIC_TAC_TOE
    Welcome to the Terminal Tic-Tac-Toe!
    Tic-Tac-Toe is a two player game played on a 9-squared board.
    The players take turns to choose a square to place their letter ('X' or 'O').
    The goal is to get three of your letters in a row, either horizontally, vertically, or diagonally.
    Let's start the game now!
    TIC_TAC_TOE
    puts intro
  end

  # starts the game
  def play_game
    introduction
    puts "
    This is the board where you will mark your letters.
    The positions of each square is provided as numbers between 1 and 9.
    For placing your letters provide the number of the square you wish to place the letters in.
    "
    display_board
    puts "
    Please enter your names first to play!
    "
    print "Please enter your name Player1('X') : "
    player_one = gets.chomp
    print "Please enter your name Player2('O') : "
    player_two = gets.chomp
    puts ''
    turns = 1
    current_player = nil
    mark = nil
    loop do
      if turns == 10
        puts "Game Over! It's a draw!"
        break
      end
      turns.odd? ? ((current_player = player_one) && (mark = 'X')) : ((current_player = player_two) && (mark = 'O'))
      print "#{mark} | #{current_player} please enter your position : "
      position = verify_position(gets.chomp)
      while position.nil? || vacant?(position) == false
        puts 'Invalid input. Please try again.'
        print "#{mark} | #{current_player}, please enter your position: "
        position = verify_position(gets.chomp)
      end
      place_mark(position, mark)
      display_board
      result = game_over?(@board)
      if result == true
        winner = current_player
        puts 'Game Over!'
        puts "#{winner} wins!"
        break
      end
      turns += 1
    end
  end

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

    false
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

  # gets input from the user and verifies it
  def verify_position(input)
    input = input.to_i
    return unless input.is_a?(Integer)

    input.between?(1, 9) ? input : nil
  end

  # checks if the position is vacant or not
  def vacant?(position)
    b = @board
    b[position - 1].is_a?(Integer) ? true : false
  end
end
