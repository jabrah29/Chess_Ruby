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

    final_coords=[Integer(to_x), Integer(to_y)]
    if self.has_completed_first_move == false and distance == 2
      if self.is_white?
        move=Move_On_Board.move(self.get_x, self.get_y, distance, Move_On_Board::UP)
      elsif self.is_black?
        move=Move_On_Board.move(self.get_x, self.get_y, distance, Move_On_Board::DOWN)
      end
      if move == final_coords
        self.has_completed_first_move = true
        return true
      end
    end

    if self.is_white?
      move_up=Move_On_Board.move(self.get_x, self.get_y, distance, Move_On_Board::UP)
      move_left=Move_On_Board.move(self.get_x, self.get_y, distance, Move_On_Board::TOP_LEFT)
      move_right=Move_On_Board.move(self.get_x, self.get_y, distance, Move_On_Board::TOP_RIGHT)
    elsif self.is_black?
      move_up=Move_On_Board.move(self.get_x, self.get_y, distance, Move_On_Board::DOWN)
      move_left=Move_On_Board.move(self.get_x, self.get_y, distance, Move_On_Board::BOTTOM_LEFT)
      move_right=Move_On_Board.move(self.get_x, self.get_y, distance, Move_On_Board::BOTTOM_RIGHT)
    end

    if move_left == final_coords or move_right == final_coords or move_up == final_coords
      return true
    end

    if distance == 2
      if !self.has_completed_first_move
        move=Move_On_Board.move(self.get_x, self.get_y, 2, Move_On_Board::UP)
        if move == final_coords
          return true
        end
      end
    elsif distance == -2
      if !self.has_completed_first_move
        move=Move_On_Board.move(self.get_x, self.get_y, 2, Move_On_Board::UP)
        if move == final_coords
          return true
        end
      end
    elsif distance ==1
      if Move_On_Board.move(self.get_x, self.get_y, 1, Move_On_Board::UP) == final_coords and self.is_black?
        return true
      elsif Move_On_Board.move_diagonal(self.get_x, self.get_y, 1, Move_On_Board::TOP_RIGHT) == final_coords and self.is_white?
        return true
      end
    else
      return false
    end


    return false
  end
end
