require_relative '../Pieces/piece_strings'

class Draw_Board


  def self.draw_board

   for i in 0..7 do
      for j in 0..7 do
          if i == 1
            print " #{Piece_Strings::White::PAWN} "
          elsif i == 6
            print " #{Piece_Strings::Black::PAWN} "
          elsif (j == 0 or j == 7) and (i==0)
            print " #{Piece_Strings::White::ROOK} "
          elsif (j==0 or j==7 ) and i == 7
            print " #{Piece_Strings::Black::ROOK} "
          elsif (j==1 or j==6) and i ==0
            print " #{Piece_Strings::White::KNIGHT} "
          elsif (j==1 or j==6) and i == 7
            print " #{Piece_Strings::Black::KNIGHT} "
          elsif (j==2 or j==5) and i ==0
            print " #{Piece_Strings::White::BISHOP} "
          elsif (j==2 or j==5) and i ==7
            print " #{Piece_Strings::Black::BISHOP} "
          elsif j ==3 and i ==0
            print " #{Piece_Strings::White::QUEEN} "
          elsif j == 3 and i == 7
            print " #{Piece_Strings::Black::QUEEN} "
          elsif j==4 and i==0
            print " #{Piece_Strings::White::KING} "
          elsif j==4 and i==7
            print " #{Piece_Strings::Black::KING} "

          else
            print " - "
          end
      end
      puts "\n"
   end


  end


end


Draw_Board.draw_board