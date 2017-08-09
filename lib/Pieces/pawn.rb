require_relative 'piece'
require_relative 'piece_strings'
require_relative '../Gameplay/move_piece'

class Pawn < Piece

  attr_accessor :has_completed_first_move

  def initialize(team,x_coord,y_coord,piece_string)
    super(team,x:x_coord,y:y_coord)
    @piece_on_board=piece_string
    @has_completed_first_move=false
  end


  def is_valid_move?(x,y)

  end


  def valid_for_pawn?(to_x, to_y, distance)

    final_coords=[to_x, to_y]

    if distance == 2
      if !self.has_completed_first_move
        if Piece_Actions::Move_On_Board::move(self.get_x, self.get_y, 2, Piece_Actions::Move_On_Board::UP) == final_coords
          return true
        end
      end
    elsif distance ==1
      if Piece_Actions::Move_On_Board::move(self.get_x, self.get_y, 1, Piece_Actions::Move_On_Board::UP) == final_coords
        return true
      elsif Piece_Actions::Move_On_Board::move_diagonal(self.get_x, self.get_y, 1, Piece_Actions::Move_On_Board::TOP_RIGHT) == final_coords
        return true
      end
    end


    return false
  end
end