class Board

  def self.initialize_pieces
    @@chess_board=Array.new(8) {Array.new(8,nil)}
  end


  def self.is_piece_at_location?(player, **at_coordinates)

    player.get_current_pieces.each do |piece|
      if piece[1].get_x == at_coordinates[:x] and piece[1].get_y == at_coordinates[:y]
        return true
      end
    end
    return false
  end


  def self.is_spot_avaliable?(player,at_x,at_y)
    player.get_current_pieces.each do |piece|
      if piece[1].get_x == at_x and piece[1].get_y == at_y
        return false
      end
    end
    return true
  end

  def self.distance_for_multiple_movements(piece,to_x,to_y, directions)
    times=0
    case directions
      when Piece_Actions::Move_On_Board::UP
        times=to_y-piece.get_y
      when Piece_Actions::Move_On_Board::DOWN
        times=piece.get_y-to_y
      when Piece_Actions::Move_On_Board::RIGHT
        times=to_x-piece.get_x
      when Piece_Actions::Move_On_Board::LEFT
        times=piece.get_x - to_x
        #TODO: add for diagonales
    end
    return times
  end



  def self.set_up_game
    initialize_pieces
    put_pieces_on_board
    display_board

  end

  def self.put_pieces_on_board

    player_white_pieces=Hash.new
    player_black_piece=Hash.new

    for i in 0..7 do
      for j in 0..7 do
        case i
          when 6
            pawn=Pawn.new("B_p#{i}_#{j}",Color::BLACK, i, j, Print::Black::PAWN)
            @@chess_board[i][j]=pawn
            player_black_piece[pawn.get_id]= pawn
          when 1
            pawn= Pawn.new("W_p#{i}_#{j}",Color::WHITE, i, j, Print::White::PAWN)
            @@chess_board[i][j]= pawn
            player_white_pieces[pawn.get_id]= pawn

        end
        case i
          when 0 # White first row
            case j
              when 0,7 #rook
                @@chess_board[i][j]=Rook.new "W_r#{i}_#{j}",Color::WHITE, i, j, Print::White::ROOK
                player_white_pieces[@@chess_board[i][j].get_id]= @@chess_board[i][j]
              when 1,6 #knights
                knight=Knight.new("W_k#{i}_#{j}",Color::WHITE, i, j, Print::White::KNIGHT)
                @@chess_board[i][j]=knight
                player_white_pieces[knight.get_id]= knight
              when 2,5 #bishops
                bishop= Bishop.new("W_b#{i}_#{j}",Color::WHITE, i, j, Print::White::BISHOP)
                @@chess_board[i][j]=bishop
                player_white_pieces[bishop.get_id]=bishop
              when 3
                queen=Queen.new("W_q#{i}_#{j}",Color::WHITE,i,j,Print::White::QUEEN)
                @@chess_board[i][j]=queen
                player_white_pieces[queen.get_id]=queen
              when 4
                king=King.new("W_q#{i}_#{j}",Color::WHITE,i,j,Print::White::KING)
                @@chess_board[i][j]=king
                player_white_pieces[king.get_id]=king
            end

          when 7
            case j
              when 0,7 #rook
                bishop= Rook.new("B_b#{i}_#{j}",Color::BLACK, i, j, Print::Black::ROOK)
                @@chess_board[i][j]=bishop
                player_black_piece[bishop.get_id]= bishop
              when 1,6 #knights
                knight=Knight.new("B_k#{i}_#{j}",Color::BLACK, i, j, Print::Black::KNIGHT)
                @@chess_board[i][j]=knight
                player_black_piece[knight.get_id]= bishop
              when 2,5 #bishops
                bishop= Bishop.new("B_b#{i}_#{j}",Color::BLACK, i, j, Print::Black::BISHOP)
                @@chess_board[i][j]=bishop
                player_black_piece[bishop.get_id]=bishop
              when 3
                queen=Queen.new("B_q#{i}_#{j}",Color::BLACK,i,j,Print::Black::QUEEN)
                @@chess_board[i][j]=queen
                player_black_piece[queen.get_id]=queen
              when 4
                king=King.new("B_q#{i}_#{j}",Color::BLACK,i,j,Print::Black::KING)
                @@chess_board[i][j]=king
                player_black_piece[king.get_id]=king
            end

        end
      end

    end

    Player_White.initialize_pieces(player_white_pieces)
    Player_Black.initialize_pieces(player_black_piece)

  end

  def self.display_board
    @@chess_board.each_index do |row|
      sub_arr=@@chess_board[row]
      sub_arr.each_index do |col|
        if(@@chess_board[row][col].class < Piece)
          print "#{@@chess_board[row][col].get_piece} "
        else
          print ". "
        end
      end
      print"\n"
    end
  end
end

