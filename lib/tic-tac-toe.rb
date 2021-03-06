class Player 
  attr_accessor :name, :symbol
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

class Board 
  
  attr_accessor :game_over
  attr_reader :state
  
  @@initial_state = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
  
  def initialize
    @state = @@initial_state
    @game_over = false
  end

  def make_board
    image = " 
     #{@state[0][0]} | #{@state[0][1]} | #{@state[0][2]}
    ---|---|---
     #{@state[1][0]} | #{@state[1][1]} | #{@state[1][2]}
    ---|---|---
     #{@state[2][0]} | #{@state[2][1]} | #{@state[2][2]}
    "
  end

  def round(player)
    puts "It's #{player.name}'s turn!"
    puts "Enter your move as follows: row number, column number."
    puts "Otherwise, enter q to quit."
    move = gets.chomp
    if move == "q"
      puts "Thanks for playing!"
      @game_over = true
      return
    end
    moves = move.gsub(" ", "").split(",").map { |x| x.to_i - 1 } 
    if @state[moves[0]][moves[1]] == " "
      @state[moves[0]][moves[1]] = player.symbol 
    else
      puts "Invalid move! Try again."
      round(player)
    end
    puts make_board
  end

  def winner?
    if (@state[0][0] == @state[0][1] && @state[0][1] == @state[0][2]) && @state[0][0] != " "
      return true
    elsif (@state[1][0] == @state[1][1] && @state[1][1] == @state[1][2]) && @state[1][0] != " "
      return true
    elsif (@state[2][0] == @state[2][1] && @state[2][1] == @state[2][2]) && @state[2][0] != " "
      return true
    elsif (@state[0][0] == @state[1][0] && @state[1][0] == @state[2][0]) && @state[0][0] != " "
      return true
    elsif (@state[0][1] == @state[1][1] && @state[1][1] == @state[2][1]) && @state[0][1] != " "
      return true
    elsif (@state[0][2] == @state[1][2] && @state[1][2] == @state[2][2]) && @state[0][2] != " "
      return true
    elsif (@state[0][0] == @state[1][1] && @state[1][1] == @state[2][2]) && @state[0][0] != " "
      return true
    elsif (@state[0][2] == @state[1][1] && @state[1][1] == @state[2][0]) && @state[0][2] != " "
      return true
    else
      return false
    end
  end

  def draw?
    (!@state[0].include?(" ") && !@state[1].include?(" ")) && !@state[2].include?(" ")
  end

end


def play_game
  puts "Welcome to Terminal Tic-Tac-Toe!"
  puts " "
  puts "What is the first player's name?"
  name_1 = gets.chomp
  puts "Welcome, #{name_1}! You'll be playing as X."
  puts " "
  puts "What is the second player's name?"
  name_2 = gets.chomp
  puts "Welcome, #{name_2}! You'll be playing as O."
  puts " "

  player_1 = Player.new(name_1, "X")
  player_2 = Player.new(name_2, "O")
  board = Board.new
  puts board.make_board

  # Use turn variable to alternate players
  turn = 1
  while board.game_over == false
    if turn % 2 == 1
      board.round(player_1)
      turn += 1
    else
      board.round(player_2)
      turn += 1
    end
    if board.winner?
      board.game_over = true
      if turn % 2 == 0
        puts "Game over! Victory goes to #{player_1.name}!"
      else
        puts "Game over! Victory goes to #{player_2.name}!"
      end
    end
    if board.draw?
      board.game_over = true
      puts "Game over! It's a draw."
    end
  end
end
  
play_game