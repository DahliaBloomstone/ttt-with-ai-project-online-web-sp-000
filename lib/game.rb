#Represents a singular instance of a TicTacToe session.
class Game

  attr_accessor :board, :player_1, :player_2, :winner, :user_input

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6] ]

#Initialize accepts two players and a board. Player 1 = class Human that inherits from the Player. Player 1 = X. Player 2 = O.
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new) #initializes with an empty board.
    @player_1 = player_1 #provides access to player 1
    @player_2 = player_2 #provides access to player 2
    @board = board #provides access to the board
    @board.display #access to board display
  end

#Returns current player X for the 3rd move. (Odd turn count)
#game.board.cells = ["O", " ", " ", " ", "X", " ", " ", " ", " "]
def current_player
     board.turn_count.odd? ? player_2 : player_1
  end

  def won?
  #it 'returns false for a draw' do
  #game = Game.new
  #game.board.cells = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
    WIN_COMBINATIONS.each do |combination|  #iterate through each winning combination
        if @board.cells[combination[0]] == @board.cells[combination[1]] &&
          @board.cells[combination[1]] == @board.cells[combination[2]] &&
          @board.taken?(combination[0]+1)
          #game.board.cells = ["O", "O", "O",
                            #  "X", "X", " ",
                            #  " ", " ", "X"]

        #  expect(game.won?).to contain_exactly(0, 1, 2)

          return combination
        end
      end
    return false
  end


  def draw? #returns true for a draw and false for a win
    @board.full? && !won? ? true : false
  end

  def over?
     (won? || draw?) ? true : false
     # IF board is not full, game is in progress (FALSE), ELSE, game is over (TRUE)
  end

  def winner
    if won?
      combination = won?
      @board.cells[combination[0]] # X or O
    end
  end

  def turn
    puts "Please enter a number 1-9:"
    @user_input = current_player.move(@board)
    if @board.valid_move?(@user_input)
      @board.update(@user_input, current_player)
    else puts "Please enter a number 1-9:"
      @board.display
      turn
    end
    @board.display
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end


end
