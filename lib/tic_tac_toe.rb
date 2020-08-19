class TicTacToe
attr_accessor :board
WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Diagonal left to right
  [2,4,6] #Diagonal right to left
]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

  def input_to_index(space)
    space = space.to_i-1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    if position_taken?(index) || !index.between?(0,8)
      return false
    else
      return true
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    space = gets
    space = input_to_index(space)
    if valid_move?(space)
      move(space, current_player)
      display_board
    else
      turn
    end
  end

  def won?
      WIN_COMBINATIONS.each do |combo|
        position_1 = board[combo[0]]
        position_2 = board[combo[1]]
        position_3 = board[combo[2]]
        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          true
          return combo
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          true
          return combo
        end
      end
      false
    end

  def full?
       turn_count == 9
  end

  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end

  def over?
    if won? || draw?
      true
    elsif full?
      true
    else
      false
    end
  end

  def winner
    if won?
      turn_count % 2 == 0 ? "O" : "X"
    end
  end

end
