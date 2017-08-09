require_relative 'piece'
require_relative '../Gameplay/move_piece'

class Queen < Piece
  attr_accessor :has_completed_first_move

  def initialize(team,x_coord,y_coord,piece_string)
    super(team,x:x_coord,y:y_coord)
    @piece_on_board=piece_string
    @has_completed_first_move=false
  end

  def valid_for_queen(to_x,to_y,straight_directions,diagonal_directions)
    final_coords=[to_x,to_y]

    straight_directions.each do |dir|
      times=Board.distance_for_multiple_movements(self,to_x,to_y,dir)
      validate=queen_direction_movement( dir, false,times)
      if validate == final_coords
        return true
      elsif validate ==[nil, nil] or validate == [-1, -1]
        return false
      end
    end

    diagonal_directions.each do |dir|
      times=Board.distance_for_multiple_movements(self,to_x,to_y,dir)
      validate=queen_direction_movement(dir, true,times)
        if validate == final_coords
          return true
        elsif validate ==[nil, nil] or validate == [-1, -1]
          return false
        end
    end

    return false
  end



  def queen_direction_movement(direction, is_diagonal,number_of_times)
    result=[]
    if is_diagonal
      result= Piece_Actions::Move_On_Board::move_diagonal(self.get_x, self.get_y, number_of_times, direction)
    else
      result= Piece_Actions::Move_On_Board::move(self.get_x, self.get_y, number_of_times, direction)
    end
    return result
  end
end
