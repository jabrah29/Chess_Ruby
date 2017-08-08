require_relative '../Pieces/piece_strings'
require_relative '../Pieces/pawn'
require_relative '../Player/color'
require_relative '../Player/player_white'
require_relative '../Player/player_black'
class Main
  MAX_SIZE=8

  def self.get_max_size
    retunr MAX_SIZE
  end

  @@current_player
  @@waiting_player
  def self.put_pieces_on_board

    @@current_player= Player_White.new("Jacob")
    @@waiting_player= Player_Black.new("Bob")

    list=[]

    player_white_pieces=Hash.new
    player_black_piece=Hash.new


    for i in 1..8 do
      for j in 1..8 do
        if i == 2
          player_white_pieces["pawn#{i}_#{j}"]= Pawn.new(Color::WHITE,i,j,Piece_Strings::White::PAWN)
        elsif i == 7
          player_black_piece["pawn#{i}_#{j}"]= Pawn.new(Color::BLACK,i,j,Piece_Strings::Black::PAWN)
        elsif i == 1 and (j == 1 or j == 8)
          player_white_pieces["rook#{i}_#{j}"]= Pawn.new(Color::WHITE,i,j,Piece_Strings::White::ROOK)
        elsif i == 8 and (j==1 or j == 8)
          player_black_piece["rook#{i}_#{j}"]= Pawn.new(Color::BLACK,i,j,Piece_Strings::Black::ROOK)
        end
      end

    end

    Player_White.initialize_pieces(player_white_pieces)
    Player_Black.initialize_pieces(player_black_piece)
  end



  def self.get_current_player
    return @@current_player
  end

  def self.get_waiting_player
    return @@waiting_player
  end




end