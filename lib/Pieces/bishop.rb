require_relative '../Gameplay/move_piece'
require_relative 'piece'

class Bishop < Piece
  attr_accessor :has_completed_first_move

  def initialize(id,team,x_coord,y_coord,piece_string)
    super(id,team,x:x_coord,y:y_coord)
    @piece_on_board=piece_string
    @has_completed_first_move=false
  end


  def is_valid_move?(x,y)

  end


  def valid_for_bishop(to_x, to_y,diagonal_directions)
    final_coords=[to_x, to_y]
    times=to_x-self.get_x

    diagonal_directions.each do |dir|
      time=Board.distance_for_multiple_movements(self,to_x,to_y,dir)
      response= bishop_movement(dir,time)
      if response == final_coords
        return true
      elsif response == [nil, nil] or response == [-1, -1]
        return false
      end
    end
    return false
  end

  def get_piece
    return @piece_on_board
  end

  def bishop_movement(direction, times)
    if direction == Move_On_Board::TOP_RIGHT
      return (Move_On_Board::move_diagonal(self.get_x, self.get_y, times, direction))
    elsif direction == Move_On_Board::TOP_LEFT
      return (Move_On_Board::move_diagonal(self.get_x, self.get_y, times, direction))
    end
  end
end
