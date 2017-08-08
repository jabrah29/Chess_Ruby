require_relative 'move_piece'
require_relative '../Board/board'
require_relative '../Pieces/king'
require_relative '../Player/player_white'
require_relative '../Gameplay/main'
require_relative '../Pieces/rook'
module Valid_Moves

  @@straight_directions=[Piece_Actions::Move_On_Board::UP,Piece_Actions::Move_On_Board::DOWN,Piece_Actions::Move_On_Board::LEFT,Piece_Actions::Move_On_Board::RIGHT]
  @@diagonal_directions=[Piece_Actions::Move_On_Board::TOP_LEFT,Piece_Actions::Move_On_Board::TOP_RIGHT,Piece_Actions::Move_On_Board::BOTTOM_RIGHT,Piece_Actions::Move_On_Board::BOTTOM_LEFT]


  def self.valid_for_pawn?(pawn,to_x,to_y,distance)
    return false if base_error_conditions_fail?(to_x, to_y, pawn)

    final_coords=[to_x,to_y]

    if distance == 2
      if !pawn.has_completed_first_move
        if Piece_Actions::Move_On_Board::move(pawn.get_x,pawn.get_y,2,Piece_Actions::Move_On_Board::UP) == final_coords
            return true
        end
      end
    elsif distance ==1
      if Piece_Actions::Move_On_Board::move(pawn.get_x,pawn.get_y,1,Piece_Actions::Move_On_Board::UP) == final_coords
        return true
      elsif Piece_Actions::Move_On_Board::move_diagonal(pawn.get_x,pawn.get_y,1,Piece_Actions::Move_On_Board::TOP_RIGHT) == final_coords
        return true
      end
    end


    return false
  end

  def self.valid_for_rook?(rook,to_x,to_y)
    return false if base_error_conditions_fail?(to_x, to_y, rook)

      times=to_x-rook.get_x

      @@straight_directions.each do |dir|
        if Piece_Actions::Move_On_Board::move(rook.get_x,rook.get_y,times,dir)
          return true
        end
      end

    return false
  end


  def self.valid_for_king?(king,to_x,to_y)
    return false if base_error_conditions_fail?(to_x,to_y,king)

    result_coord=[to_x,to_y]

    @@straight_directions.each do |dir|
      if king_direction_movement(king,dir,false) == result_coord
        return true
      else
        print" "
      end
    end

    @@diagonal_directions.each do |dir|
      if king_direction_movement(king,dir,true) == result_coord
        return true
      else
        print" "
      end
    end
    return false
  end





  def self.base_error_conditions_fail?(x,y,piece)
    case piece
      when piece.instance_of?(Pawn)
        is_there_collision?(to_x,to_y) or (x>Main.get_max_size or y>Main.get_max_size) or (x<1 or y<1)
      when piece.instance_of?(Rook)
        is_there_collision?(to_x,to_y) or (rook.get_x != to_x and rook.get_y != to_y) or (x>Main.get_max_size or y>Main.get_max_size)
      when piece.instance_of?(King)

    end
  end



  def self.is_there_collision?(to_x,to_y)
    b= Board.is_piece_at_location?(Main.get_current_player,x:to_x,y:to_y)
    return b
  end

  def self.valid_pawn_diagonals?(pawn,to_coord)
    Piece_Actions::Move_On_Board::move_diagonal(pawn.get_x,pawn.get_y,1,Piece_Actions::Move_On_Board::TOP_LEFT)==to_coord or Piece_Actions::Move_On_Board::move_diagonal(pawn.get_x,pawn.get_y,1,Piece_Actions::Move_On_Board::TOP_RIGHT) == to_coord
  end

  def self.king_direction_movement(king,direction, is_diagonal)
    result=[]
    if is_diagonal
      result= Piece_Actions::Move_On_Board::move_diagonal(king.get_x,king.get_y,1,direction)
    else
      result= Piece_Actions::Move_On_Board::move(king.get_x,king.get_y,1,direction)
    end
   return result
  end

  def self.can_attack_opposite_piece?(to_x,to_y)
    b= Board.is_piece_at_location?(Main.get_waiting_player,x:to_x,y:to_y)
    return b
  end


end
