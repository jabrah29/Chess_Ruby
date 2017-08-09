require_relative 'move_piece'
require_relative '../Board/board'
require_relative '../Pieces/king'
require_relative '../Player/player_white'
require_relative '../Gameplay/main'
require_relative '../Pieces/rook'
require_relative '../Pieces/bishop'
module Valid_Moves

  @@straight_directions=[Piece_Actions::Move_On_Board::UP, Piece_Actions::Move_On_Board::DOWN, Piece_Actions::Move_On_Board::LEFT, Piece_Actions::Move_On_Board::RIGHT]
  @@diagonal_directions=[Piece_Actions::Move_On_Board::TOP_LEFT, Piece_Actions::Move_On_Board::TOP_RIGHT, Piece_Actions::Move_On_Board::BOTTOM_RIGHT, Piece_Actions::Move_On_Board::BOTTOM_LEFT]
  @@knight_directions=[Piece_Actions::Move_On_Board::KNIGHT_UP_RIGHT,Piece_Actions::Move_On_Board::KNIGHT_RIGHT_UP,Piece_Actions::Move_On_Board::KNIGHT_LEFT_DOWN,Piece_Actions::Move_On_Board::KNIGHT_DOWN_LEFT,Piece_Actions::Move_On_Board::KNIGHT_DOWN_RIGHT,Piece_Actions::Move_On_Board::KNIGHT_RIGHT_DOWN, Piece_Actions::Move_On_Board::KNIGHT_UP_LEFT,Piece_Actions::Move_On_Board::KNIGHT_LEFT_UP]

  def self.is_move_for_pawn_valid?(pawn, to_x, to_y, distance)
    return false if base_error_conditions_fail?(to_x, to_y, pawn)

    return pawn.valid_for_pawn?(to_x, to_y, distance)
  end

  def self.is_move_for_rook_valid?(rook, to_x, to_y)
    return false if base_error_conditions_fail?(to_x,to_y,rook)
    return rook.valid_for_rook?(to_x, to_y, @@straight_directions)
  end


  def self.is_move_for_king_valid?(king, to_x, to_y)
    return false if base_error_conditions_fail?(to_x, to_y, king)
    return king.valid_for_king?(to_x,to_y,@@straight_directions,@@diagonal_directions)
  end


  def self.is_move_for_bishop_valid?(bishop, to_x, to_y)
    return false if base_error_conditions_fail?(to_x, to_y, bishop)
    return bishop.valid_for_bishop(to_x, to_y)
  end

  def self.is_move_for_queen_valid?(queen,to_x,to_y)
    return false if base_error_conditions_fail?(to_x,to_y,queen)
    return queen.valid_for_queen(to_x,to_y,@@straight_directions,@@diagonal_directions)

  end

  def self.is_move_for_knight_valid?(knight,to_x,to_y)
    return false if base_error_conditions_fail?(to_x,to_y,knight)
    return knight.valid_for_knight(to_x,to_y,@@knight_directions)
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

  def self.valid_pawn_diagonals?(pawn, to_coord)
    Piece_Actions::Move_On_Board::move_diagonal(pawn.get_x, pawn.get_y, 1, Piece_Actions::Move_On_Board::TOP_LEFT)==to_coord or Piece_Actions::Move_On_Board::move_diagonal(pawn.get_x, pawn.get_y, 1, Piece_Actions::Move_On_Board::TOP_RIGHT) == to_coord
  end



  def self.can_attack_opposite_piece?(to_x, to_y)
    b= Board.is_piece_at_location?(Main.get_waiting_player, x: to_x, y: to_y)
    return b
  end


end

