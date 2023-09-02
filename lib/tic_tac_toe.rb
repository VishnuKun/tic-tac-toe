# tic-tac-toe

# class player
class Game
  # instance variable for turn
  @@turn_count = 1
  @@winner = false
  # get player1's and player2's names
  # create grid
  def initialize
    print "What's your name player1?  => "
    @name_player_one = gets.chomp
    print "What's your name player2? => "
    @name_player_two = gets.chomp
    puts "\r"
    puts "Welcome to the board!"
    @board = Array.new(3) { Array.new(3,'_')}
    # method to display grid information
    def grid(board)
      puts "\r"
      puts "\r"
      puts "#{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]}"
      puts "#{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]}"
      puts "#{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]}"
      puts "\r"
    end
    # display the board 
    self.grid(@board)
    # take the position from the player
    # and display it in the board
    def display_turn(x, y, mark)
      @board[x.to_i][y.to_i] = mark
    end
    # check winner
    def winner(board)
      # check rows
      @rows = board.any? { |x| x.all? { |word| word == 'X' || word == 'O'}}
      # check columns
      @columns = board.transpose.any? { |x| x.all? { |word| word == 'X' || word == 'O'}}
      # check diagonals
      @diagonal_array = []
      @diag_one = []
      @diag_two = []
      @diag_one << @board[0][2] << @board[1][1] << @board[2][0]
      @diag_two << @board[0][0] << @board[1][1] << @board[2][2]
      @diagonal_array << @diag_one << @diag_two 

      @diagonals = @diagonal_array.any? { |arr| arr.all? { |word| word == 'X' || word == 'O'} }
      
      if @diagonals == true
        @@winner = true
      else
        @@winner = false
      end
    end
    # give each player turn and ask for their position
    def turns
      loop do
        if @@turn_count.odd?
          # print turn statement
          print "Your turn #{@name_player_one}, give x position : "
          # take players choice
          @x = gets.chomp
          # print turn statement
          print "Your turn #{@name_player_one}, give y position : "
          # take players choice
          @y = gets.chomp
          # run display turn 
          self.display_turn(@x, @y, 'X')
          # display the matrix
          self.grid(@board)
          # add one to turn count
          @@turn_count += 1
        else
          # print turn statement
          print "Your turn #{@name_player_two}, give x position : "
          # take players choice
          @x = gets.chomp
          # print turn statement
          print "Your turn #{@name_player_two}, give y position : "
          # take players choice
          @y = gets.chomp
          # run display turn 
          self.display_turn(@x, @y, 'O')
          # display the matrix
          self.grid(@board)
          # add one to turn count
          @@turn_count += 1
        end
        self.winner(@board)
        if @@winner == true || @@turn_count > 8
          puts "Game Over!"
          break
        end
      end
    end
    # run turns method
    self.turns
  end
  
  
end