require 'test/unit'
require_relative '../lib/Player/color'
require_relative '../lib/Pieces/pawn'
require_relative '../lib/Pieces/rook'
require_relative '../lib/Pieces/queen'
require_relative '../lib/Pieces/bishop'
require_relative '../lib/Pieces/knight'
require_relative '../lib/Gameplay/valid_conditions'
require_relative '../lib/Pieces/print'
require_relative '../lib/Pieces/piece_factory'
require_relative '../lib/Pieces/main'

class Test_Valid_Methods < Test::Unit::TestCase

  @@current_player
  @@other_player

  data={
  }
  def setup
    Main.set_players
    Board.set_up_game
  end
  def test_valid_for_pawn
    pawn=Pawn.new("W_p2_3",Color::WHITE, 2, 3, Print::White::PAWN)
    @p_fact=Piece_Factory.new(pawn)
    valid=@p_fact.is_move_valid?(2,4)
    puts "pawn: #{valid}"
    assert_equal(valid,true)
  end

  def test_valid_for_rook
    rook=Rook.new("W_r3_0",Color::WHITE, 3, 0, Print::White::ROOK)
    @p_fact=Piece_Factory.new(rook)
    valid=@p_fact.is_move_valid?( 3, 3)
    puts "rook: #{valid}"
    assert_equal(valid,true)
  end


  def test_valid_for_knight
    knight=Knight.new("W_k2_3",Color::WHITE, 2, 3, Print::White::KNIGHT)
    @p_fact=Piece_Factory.new(knight)
    valid=@p_fact.is_move_valid?( 0, 5)
    puts "knight: #{valid}"
    assert_equal(valid,false)
  end

  def test_valid_for_king
    king=King.new("W_k4_4",Color::WHITE, 4, 4, Print::White::KING)
    @p_fact=Piece_Factory.new(king)
    valid=@p_fact.is_move_valid?( 3, 3)
    puts "king: #{valid}"
    assert_equal(valid,true)
  end

  def test_valid_for_queen
    queen= Queen.new("W_q6_2",Color::WHITE, 6, 2, Print::White::QUEEN)
    @p_fact=Piece_Factory.new(queen)
    valid=@p_fact.is_move_valid?( 2, 6 )
    puts "queen: #{valid}"
    assert_equal(valid,true)
  end

  def test_valid_for_bishop
    bishop=Bishop.new("W_b1_1",Color::WHITE, 1, 1, Print::White::BISHOP)
    @p_fact=Piece_Factory.new(bishop)
    valid=@p_fact.is_move_valid?(7, 6)
    puts "queen: #{valid}"

    assert_equal(valid,false)
  end
end

