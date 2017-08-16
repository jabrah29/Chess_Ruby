require_relative 'move_piece'
require_relative '../Board/board'
require_relative '../Pieces/king'
require_relative '../Player/player_white'
require_relative '../Pieces/rook'
require_relative '../Pieces/bishop'
class Valid_Conditions

  @@straight_directions=[1,5,6,7]
  @@diagonal_directions=[1,5,6,7]
  @@knight_directions=[1,3,5,6]



  def self.get_all_straight_directions
    return @@straight_directions
  end

  def self.get_all_diagonal_directions
    return @@diagonal_directions
  end

  def self.get_all_knights_directions
    return @@knight_directions
  end


  def self.base_error_conditions_fail?(x, y, piece)
    case piece
      when piece.instance_of?(Pawn)
        is_there_collision?(to_x, to_y) or (x>Main.get_max_size or y>Main.get_max_size) or (x<1 or y<1)
      when piece.instance_of?(Rook)
        is_there_collision?(to_x, to_y) or (rook.get_x != to_x and rook.get_y != to_y) or (x>Main.get_max_size or y>Main.get_max_size)
      when piece.instance_of?(Bishop)
        is_there_collision?(to_x, to_y) or (x>Main.get_max_size or y>Main.get_max_size) or (x<1 or y<1)
      when piece.instance_of?(King)
        is_there_collision?(to_x, to_y) or (x>Main.get_max_size or y>Main.get_max_size) or (x<1 or y<1)

    end
  end


  def self.is_there_collision?(to_x, to_y)
    return Board.is_piece_at_location?(Main.get_current_player, x: to_x, y: to_y)

  end



end

