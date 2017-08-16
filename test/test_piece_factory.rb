require 'test/unit'
require_relative '../lib/Board/board'
require_relative '../lib/Pieces/pawn'
require_relative '../lib/Gameplay/move_piece'
require_relative '../lib/Pieces/piece_factory'

class Test_Piece_Factory < Test::Unit::TestCase

  def setup
    Main.set_players(["Main.get_player_names,","gg"])
  end
  def test_move_pawn
    puts ""
    Board.set_up_game
    pawn=Pawn.new("W_p1_1",Color::WHITE,1,1,Print::White::PAWN)
    factory=Piece_Factory.new(pawn)
    valid=factory.is_move_valid?(1,2)
    if valid

    end
    assert_equal(valid,true)
  end
end
