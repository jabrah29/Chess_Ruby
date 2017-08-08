require_relative 'piece'
require_relative 'piece_strings'

class Pawn < Piece

  attr_accessor :has_completed_first_move

  def initialize(team,x_coord,y_coord,piece_string)
    super(team,x:x_coord,y:y_coord)
    @piece_on_board=piece_string
    @has_completed_first_move=false
  end


  def is_valid_move?(x,y)

  end

  def move_forward_one
    super.mo
  end
end