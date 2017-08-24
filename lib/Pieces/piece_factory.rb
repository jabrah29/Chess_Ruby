require_relative '../Board/board'
require_relative 'king'
require_relative 'queen'
require_relative '../Player/player_white'
require_relative 'rook'
require_relative 'bishop'
require_relative 'knight'
require_relative 'pawn'
require_relative '../Gameplay/valid_conditions'
class Piece_Factory

  def initialize(piece)
    @type_of_piece=piece
  end

  def is_move_valid?( to_x, to_y)
    return false if Valid_Conditions.base_error_conditions_fail?(to_x, to_y, @type_of_piece)

    case @type_of_piece.class.name
      when "Bishop"
        return @type_of_piece.valid_for_bishop?(to_x, to_y, Valid_Conditions.get_all_diagonal_directions)
      when "Pawn"
        distance=(to_x.to_i - @type_of_piece.get_x.to_i).abs
        if distance > 2 or distance < -2 or (distance == 2 and @type_of_piece.has_completed_first_move == true)
          return false
        else
          return @type_of_piece.valid_for_pawn?(to_x,to_y,distance)
        end
      when "Queen"
        return @type_of_piece.valid_for_queen?(to_x, to_y, Valid_Conditions.get_all_straight_directions, Valid_Conditions.get_all_diagonal_directions)
      when "King"
        return @type_of_piece.valid_for_king?(to_x, to_y, Valid_Conditions.get_all_straight_directions, Valid_Conditions.get_all_diagonal_directions)
      when "Rook"
        return @type_of_piece.valid_for_rook?(to_x, to_y, Valid_Conditions.get_all_straight_directions)
      when "Knight"
        return @type_of_piece.valid_for_knight?(to_x, to_y, Valid_Conditions.get_all_knights_directions)
      else
        puts "none"

    end
  end
end
