require_relative 'piece'
require_relative '../Gameplay/move_piece'

class Knight < Piece
  attr_accessor :has_completed_first_move

  def initialize(id,team,x_coord,y_coord,piece_string)
    super(id,team,x:x_coord,y:y_coord)
    @piece_on_board=piece_string
    @has_completed_first_move=false
  end


  def get_piece
    return @piece_on_board
  end

  def valid_for_knight(to_x,to_y,diagonal_directions)
    final_coords=[to_x,to_y]
    diagonal_directions.each do |direction|
      result=Move_On_Board::move_knight(self.get_x,self.get_y,direction)
      if  result == final_coords
        return true
      elsif result ==[nil,nil] or result == [-1,-1]
        return false
      end

    end
    return false
  end
end
