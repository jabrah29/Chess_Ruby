require 'test/unit'
require_relative '../lib/Board/board'
require_relative '../lib/Pieces/main'
require_relative '../lib/Pieces/pawn'
require_relative '../lib/Gameplay/move_piece'
require_relative '../lib/Pieces/piece_factory'

class Test_Piece_Factory < Test::Unit::TestCase


  def test_move_pawn
    puts ""
    pawn=Pawn.new("W_p1_1",Color::WHITE,1,1,Print::White::PAWN)
    factory=Piece_Factory.new(pawn)
    valid=factory.is_move_valid?(1,3)
    puts valid
    if valid
      Main.current_player.move_piece(pawn,x:1,y:3)
    end
    Board.display_board
    assert_equal(valid,true)
  end
end
