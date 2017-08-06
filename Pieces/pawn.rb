require_relative 'piece'
require_relative 'piece_strings'

class Pawn < Piece


  def initialize(team,x_coord,y_coord,piece_string)
    super(team,x:x_coord,y:y_coord)
    @piece_on_board=piece_string
  end

  def move(x,y)
    Perform_Actions.move(4,5,2,Perform_Actions.new.TOP_LEFT)
  end


  def is_valid_move?(x,y)

  end

  def move_forward_one

  end
end