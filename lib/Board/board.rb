require_relative '../Player/player_white'
require_relative '../Pieces/rook'
require_relative '../Pieces/bishop'
require_relative '../Pieces/knight'
require_relative '../Pieces/queen'
require_relative '../Pieces/king'
require_relative '../Pieces/pawn'
require_relative '../Gameplay/move_piece'

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

  def self.get_chess_board
    return @@chess_board
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
      when Move_On_Board::UP, Move_On_Board::DOWN
        times=(to_x.to_i-piece.get_x.to_i).abs
      when Move_On_Board::RIGHT
        times=(to_x.to_i-piece.get_x.to_i).abs
      when Move_On_Board::TOP_LEFT, Move_On_Board::TOP_RIGHT
        times=(piece.get_x.to_i - to_x.to_i).abs
      when Move_On_Board::BOTTOM_LEFT, Move_On_Board::BOTTOM_RIGHT
        times=(to_y.to_i - piece.get_y.to_i).abs
    end
    puts "distance: #{times}"
    return times
  end



  def self.set_up_game(white,black)
    initialize_pieces
    pieces=put_pieces_on_board
    white.initialize_pieces(pieces[0])
    black.initialize_pieces(pieces[1])
    display_board

  end

  def self.put_pieces_on_board

    player_white_pieces=Hash.new
    player_black_piece=Hash.new

    for i in 0..7 do
      for j in 0..7 do

        case i
          when 6
            pawn=Pawn.new("bpawn#{i}#{j}",Color::BLACK, i, j, Print::Black::PAWN)
            @@chess_board[i][j]=pawn
            player_black_piece[pawn.get_id]= pawn
          when 1
            @@chess_board[i][j]= Pawn.new("wpawn#{i}#{j}",Color::WHITE, i, j, Print::White::PAWN)
            player_white_pieces[@@chess_board[i][j].get_id]=  @@chess_board[i][j]

        end
        case i
          when 0 # White first row
            case j
              when 0,7 #rook
                @@chess_board[i][j]=Rook.new "wrook#{i}#{j}",Color::WHITE, i, j, Print::White::ROOK
                player_white_pieces[@@chess_board[i][j].get_id]= @@chess_board[i][j]
              when 1,6 #knights
                knight=Knight.new("wknight#{i}#{j}",Color::WHITE, i, j, Print::White::KNIGHT)
                @@chess_board[i][j]=knight
                player_white_pieces[knight.get_id]= knight
              when 2,5 #bishops
                bishop= Bishop.new("wbishop#{i}#{j}",Color::WHITE, i, j, Print::White::BISHOP)
                @@chess_board[i][j]=bishop
                player_white_pieces[bishop.get_id]=bishop
              when 3
                queen=Queen.new("wqueen#{i}#{j}",Color::WHITE,i,j,Print::White::QUEEN)
                @@chess_board[i][j]=queen
                player_white_pieces[queen.get_id]=queen
              when 4
                king=King.new("wking#{i}#{j}",Color::WHITE,i,j,Print::White::KING)
                @@chess_board[i][j]=king
                player_white_pieces[king.get_id]=king
            end

          when 7
            case j
              when 0,7 #rook
                rook= Rook.new("brook#{i}#{j}",Color::BLACK, i, j, Print::Black::ROOK)
                @@chess_board[i][j]=rook
                player_black_piece[rook.get_id]= rook
              when 1,6 #knights
                knight=Knight.new("bknight#{i}#{j}",Color::BLACK, i, j, Print::Black::KNIGHT)
                @@chess_board[i][j]=knight
                player_black_piece[knight.get_id]= bishop
              when 2,5 #bishops
                bishop= Bishop.new("bbishop#{i}#{j}",Color::BLACK, i, j, Print::Black::BISHOP)
                @@chess_board[i][j]=bishop
                player_black_piece[bishop.get_id]=bishop
              when 3
                queen=Queen.new("bqueen#{i}#{j}",Color::BLACK,i,j,Print::Black::QUEEN)
                @@chess_board[i][j]=queen
                player_black_piece[queen.get_id]=queen
              when 4
                king=King.new("bking#{i}#{j}",Color::BLACK,i,j,Print::Black::KING)
                @@chess_board[i][j]=king
                player_black_piece[king.get_id]=king
            end

        end
      end

    end

    return [player_white_pieces,player_black_piece]

  end

  def self.print_coords
    @@chess_board.each_index do |row|
      sub_arr=@@chess_board[row]
      sub_arr.each_index do |col|
        print "#{row}_#{col} "
      end
      print"\n"
    end
  end

  def self.display_board
    puts ""
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

