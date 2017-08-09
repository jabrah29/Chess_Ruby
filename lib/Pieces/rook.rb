require_relative '../Pieces/piece'
require_relative '../Gameplay/move_piece'

class Rook < Piece

  def initialize(color,x_coord,y_coord,piece_string)
    super(color,x:x_coord,y:y_coord)
    @piece_on_board=piece_string
  end

  def move_to(x,y)

  end

  def self.valid_for_rook?(to_x,to_y,straight_directions)
    final_coords=[to_x,to_y]
    times=0
    straight_directions.each do |dir|
      times=Board.distance_for_multiple_movements(self, to_x, to_y, dir)
      result= Piece_Actions::Move_On_Board::move(self.get_x, self.get_y, times, dir)
      if (Piece_Actions.validate_response(result,final_coords))
        return true
      else
        return false
      end
    end
    return false
  end


end
