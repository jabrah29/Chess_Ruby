require_relative '../Player/player_white'
require_relative '../Player/player_black'
require_relative "../Pieces/rook"
require_relative '../Pieces/queen'
require_relative '../Pieces/king'
require_relative '../Player/color'
require_relative '../Pieces/pawn'
require_relative '../Pieces/print'
require_relative '../Pieces/knight'
require_relative '../Pieces/bishop'


class Main


  @@current_player
  @@waiting_player
  def put_pieces_on_board

    @@current_player= Player_White.new("Jacob")
    @@waiting_player= Player_Black.new("Bob")

    player_white_pieces=Hash.new
    player_black_piece=Hash.new

    chess_board=Array.new(8) {Array.new(8,nil)}
    for i in 0..7 do
      for j in 0..7 do
        case i
          when 0 # White first row
            case j
              when 0,7 #rook
                chess_board[i][j]=Rook.new Color::WHITE, i, j, Print::White::ROOK
                player_white_pieces["W_r#{i}_#{j}"]= chess_board[i][j]
              when 1,6 #knights
                knight=Knight.new(Color::WHITE, i, j, Print::White::KNIGHT)
                chess_board[i][j]=knight
                player_white_pieces["W_k#{i}_#{j}"]= knight
              when 2,5 #bishops
                bishop= Knight.new(Color::WHITE, i, j, Print::White::BISHOP)
                chess_board[i][j]=bishop
                player_white_pieces["W_b#{i}_#{j}"]=bishop
              when 3
                queen=Queen.new(Color::WHITE,i,j,Print::White::QUEEN)
                chess_board[i][j]=queen
                player_white_pieces["W_q#{i}_#{j}"]=queen
              when 4
                king=King.new(Color::WHITE,i,j,Print::White::KING)
                chess_board[i][j]=king
                player_white_pieces["W_q#{i}_#{j}"]=king
            end
            #TODO: FIX COORDS
          when 1 # White pawns
              pawn= Pawn.new(Color::WHITE, i, j, Print::White::PAWN)
              chess_board[i][j]= pawn
              player_white_pieces["W_p#{i}_#{j}"]= pawn

          when 6 # Black pawns
            if j == 6
              pawn=Pawn.new(Color::BLACK, i, j, Print::Black::PAWN)
              chess_board[i][j]=pawn
              player_black_piece["B_p#{i}_#{j}"]= pawn
            end

          when 7
            case j
              when 0,7 #rook
                bishop= Pawn.new(Color::BLACK, i, j, Print::Black::ROOK)
                player_black_piece["W_b#{i}_#{j}"]= bishop
              when 1,6 #knights
                knight=Knight.new(Color::BLACK, i, j, Print::Black::KNIGHT)
                chess_board[i][j]=knight
                player_black_piece["W_k#{i}_#{j}"]= bishop
              when 2,5 #bishops
                bishop= Bishop.new(Color::BLACK, i, j, Print::Black::BISHOP)
                chess_board[i][j]=bishop
                player_black_piece["W_b#{i}_#{j}"]=bishop
              when 3
                queen=Queen.new(Color::BLACK,i,j,Print::Black::QUEEN)
                chess_board[i][j]=queen
                player_black_piece["W_q#{i}_#{j}"]=queen
              when 4
                king=King.new(Color::BLACK,i,j,Print::Black::KING)
                chess_board[i][j]=king
                player_black_piece["W_q#{i}_#{j}"]=king
            end

        end
      end

    end

    Player_White.initialize_pieces(player_white_pieces)
    Player_Black.initialize_pieces(player_black_piece)


    chess_board.each_index do |row|
      sub_arr=chess_board[row]
      sub_arr.each_index do |col|
        if(chess_board[row][col]!=nil)
          puts chess_board[row][col].get_piece << "   " << chess_board[row][col].get_x.to_s << "  " << chess_board[row][col].get_y.to_s

        end
      end
      puts
    end
  end



  def self.get_current_player
    return @@current_player
  end

  def self.get_waiting_player
    return @@waiting_player
  end







end

m=Main.new
m.put_pieces_on_board

