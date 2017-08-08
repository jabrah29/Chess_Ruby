require_relative '../Pieces/piece'

class King < Piece

  def initialize(color,x_coord,y_coord,piece_string)
    super(color,x:x_coord,y:y_coord)
    @piece_on_board=piece_string
  end

  def move_to(x,y)

  end

end