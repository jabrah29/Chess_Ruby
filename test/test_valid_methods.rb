require 'test/unit'
require_relative '../lib/Player/color'
require_relative '../lib/Pieces/pawn'
require_relative '../lib/Pieces/rook'
require_relative '../lib/Pieces/queen'
require_relative '../lib/Gameplay/valid_moves'
require_relative '../lib/Pieces/piece_strings'
require_relative '../lib/Gameplay/main'

class Test_Valid_Methods < Test::Unit::TestCase

  @@current_player
  @@other_player

  def setup
    Main.put_pieces_on_board
  end
  def test_valid_for_pawn
    pawn=Pawn.new(Color::WHITE,2,3,Piece_Strings::White::PAWN)
    valid=Valid_Moves.is_move_for_pawn_valid?(pawn, 2, 4, 1)
    assert_equal(valid,true)
  end

  def test_valid_for_rook
    rook=Rook.new(Color::WHITE,3,0,Piece_Strings::White::ROOK)
    valid=Valid_Moves.is_move_for_king_valid?(rook, 3, 3)
    assert_equal(valid,false)
  end


  def test_valid_for_king
    king=King.new(Color::WHITE,4,4,Piece_Strings::White::KING)
    valid=Valid_Moves.is_move_for_king_valid?(king, 3, 3)
    assert_equal(valid,true)
  end

  def test_valid_for_queen
    queen= Queen.new(Color::WHITE,6,2,Piece_Strings::White::QUEEN)
    valid=Valid_Moves.is_move_for_queen_valid?(queen,2,6 )
    assert_equal(valid,true)
  end
end