require_relative 'piece'
require_relative 'print'
require_relative '../Gameplay/move_piece'

class Pawn < Piece

  attr_accessor :has_completed_first_move

  def initialize(id,team,x_coord,y_coord,piece_string)
    super(id,team,x:x_coord,y:y_coord)
    @piece_on_board=piece_string
    @has_completed_first_move=false
  end


  def is_valid_move?(x,y)

  end

  def get_piece
    return @piece_on_board
  end
  def valid_for_pawn?(to_x, to_y, distance)

    final_coords=[to_x, to_y]

    if distance == 2
      if !self.has_completed_first_move
        if Move_On_Board::move(self.get_x, self.get_y, 2, Move_On_Board::UP) == final_coords
          return true
        end
      end
    elsif distance ==1
      if Move_On_Board::move(self.get_x, self.get_y, 1, Move_On_Board::UP) == final_coords
        return true
      elsif Move_On_Board::move_diagonal(self.get_x, self.get_y, 1, Move_On_Board::TOP_RIGHT) == final_coords
        return true
      end
    end


    return false
  end
end
