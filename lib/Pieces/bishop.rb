require_relative '../Gameplay/move_piece'
require_relative 'piece'

class Bishop < Piece
  attr_accessor :has_completed_first_move

  def initialize(team,x_coord,y_coord,piece_string)
    super(team,x:x_coord,y:y_coord)
    @piece_on_board=piece_string
    @has_completed_first_move=false
  end


  def is_valid_move?(x,y)

  end


  def valid_for_bishop(to_x, to_y,diagonal_directions)
    final_coords=[to_x, to_y]
    times=to_x-self.get_x

    diagonal_directions.each do |dir|

    end

    if self.is_white
      valid=bishop_going_up(Piece_Actions::Move_On_Board::TOP_RIGHT, times)
    elsif self.is_black
      valid=bishop_going_up(Piece_Actions::Move_On_Board::BOTTOM_RIGHT,times)
    end

    if (valid == final_coords)
      return true
    elsif valid == [nil, nil] or valid == [-1, -1]
      return false
    else
      go_left=bishop_going_up(Piece_Actions::Move_On_Board::TOP_LEFT, times)
      if go_left == final_coords
        return true
      elsif go_left == [nil, nil] or go_left == [-1, -1]
        return false
      end
    end

  end


  def bishop_going_up(direction, times)
    if direction == Piece_Actions::Move_On_Board::TOP_RIGHT
      return (Piece_Actions::Move_On_Board::move_diagonal(self.get_x, self.get_y, times, direction))
    elsif direction == Piece_Actions::Move_On_Board::TOP_LEFT
      return (Piece_Actions::Move_On_Board::move_diagonal(self.get_x, self.get_y, times, direction))
    end
  end
end