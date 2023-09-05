# frozen_string_literal: true

# tic-tac-toe
class Tic_Tac_Toe
  attr_accessor :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  # welcomes players and explains game details
  def introduction
    intro = <<-Tic_Tac_Toe
    Welcome to the Terminal Tic-Tac-Toe!
    Tic-Tac-Toe is a two player game played on a 9-squared board.
    The players take turns to choose a square to place their letter ('X' or 'O').
    The goal is to get three of your letters in a row, either horizontally, vertically, or diagonally.
    Let's start the game now!
    Tic_Tac_Toe
    puts intro
  end

  # starts the game
  def play_game
    # first provide intro
    introduction
    # display the board with a little explanation
    puts "
    This is the board where you will mark your letters. The positions of each square is provided as numbers between 1 and 9. 
    For placing your letters provide the number of the square you wish to place the letters in.
    "
    display_board
    # ask for two user's to give their names
    puts "
    Please enter your names first to play!
    "
    # player one
    print "Please enter your name Player1('X') : "
    player_one = gets.chomp
    # player two
    print "Please enter your name Player2('O') : "
    player_two = gets.chomp
    puts ""
    # keep count of turns
    turns = 1
    # for setting player per each turn
    current_player = nil
    mark = nil
    winner = nil
    loser = nil
    # keep asking for marking position to each player per turn
    # and until the turns reaches maximum 9
    while turns < 10 do
      # then ask players 
      turns.odd? ? ((current_player = player_one) && (mark = 'X')) : ((current_player = player_two) && (mark = 'O'))
      print "#{mark} | #{current_player} please enter your position : "
      # if position invalid then ask again
      position = verify_position(gets.chomp)
      # keep asking until a valid input is provided
      while position.nil? || vacant?(position) == false
        puts "Invalid input. Please try again."
        print "#{mark} | #{current_player}, please enter your position: "
        position = verify_position(gets.chomp)
      end
      # place the current player's mark into board as per position
      place_mark(position, mark)
      # display the board again
      display_board
      # check if any wins
      result = game_over?(@board)
      if result == true 
        winner = current_player
        loser = player_two
        puts "Game Over!"
        puts "#{winner} wins!"
        break
      end
      turns += 1
    end
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

  # gets input from the user and verifies it
  def verify_position(input)
    input = input.to_i
    input.is_a?(Integer) ? (input.between?(1, 9) ? input : nil) : nil
  end

  # checks if the position is vacant or not
  def vacant?(position)
    b = @board
    # position should contain number(between 1 and 9) to be considered vacant
    b[position - 1].is_a?(Integer) ? true : false
  end
end