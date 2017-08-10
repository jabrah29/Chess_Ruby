require 'test/unit'
require_relative '../lib/Player/color'
require_relative '../lib/Pieces/pawn'
require_relative '../lib/Pieces/rook'
require_relative '../lib/Pieces/queen'
require_relative '../lib/Pieces/bishop'
require_relative '../lib/Pieces/knight'
require_relative '../lib/Gameplay/valid_moves'
require_relative '../lib/Pieces/print'

require_relative '../lib/Gameplay/in'

class Test_Valid_Methods < Test::Unit::TestCase

  @@current_player
  @@other_player

  data={
  }
  def setup
    Main.put_pieces_on_board
  end
  def test_valid_for_pawn
    pawn=Pawn.new(Color::WHITE, 2, 3, Print::White::PAWN)
    valid=Valid_Moves.is_move_for_pawn_valid?(pawn, 2, 4, 1)
    assert_equal(valid,true)
  end

  def test_valid_for_rook
    rook=Rook.new(Color::WHITE, 3, 0, Print::White::ROOK)
    valid=Valid_Moves.is_move_for_rook_valid?(rook, 3, 3)
    assert_equal(valid,true)
  end


  def test_valid_for_knight
    knight=Knight.new(Color::WHITE, 2, 3, Print::White::KNIGHT)
    valid=Valid_Moves.is_move_for_knight_valid?(knight,0,5)
    assert_equal(valid,false)
  end

  def test_valid_for_king
    king=King.new(Color::WHITE, 4, 4, Print::White::KING)
    valid=Valid_Moves.is_move_for_king_valid?(king, 3, 3)
    assert_equal(valid,true)
  end

  def test_valid_for_queen
    queen= Queen.new(Color::WHITE, 6, 2, Print::White::QUEEN)
    valid=Valid_Moves.is_move_for_queen_valid?(queen,2,6 )
    assert_equal(valid,true)
  end

  def test_valid_for_bishop
    bishop=Bishop.new(Color::WHITE, 1, 1, Print::White::BISHOP)
    valid=Valid_Moves.is_move_for_bishop_valid?(bishop,8,7)
    assert_equal(valid,true)
  end
end

