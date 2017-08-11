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
require 'ostruct'


class Main


  @@current_player
  @@waiting_player


  def get_player_names
    puts "--Welcome--"
    puts "Enter Player White Name"
    name=gets.chomp
    puts "Enter Player Black Name"
    name2=gets.chomp
    return name,name2
  end

  def start_game
    white,black=get_player_names
    @@current_player=Player_White.new(white)
    @@waiting_player=Player_Black.new(black)
    Board.set_up_game
  end

  def get_turn_coordinates
    input=OpenStruct.new
    x,y=nil,nil
    loop do
      @@current_player.get_current_pieces.each do |piece|
        print "-> #{piece.key}\n"
      end
      print "Enter id of piece:"
      input.piece=gets.chomp
      print "Enter new x :"
      input.x=gets.chomp
      print "Enter new y :"
      input.y= gets.chomp

      if (input.x.to_s.to_i > -1 and input.x.to_s.to_i < 8) and (input.y.to_s.to_i > -1 and input.y.to_s.to_i < 8)
        puts "exiting"
        break
      end
      puts "Invalid.."
    end
    return input


  end



  def play_game
    get_turn_coordinates
  end

  def self.get_current_player
    return @@current_player
  end

  def self.get_waiting_player
    return @@waiting_player
  end


end

game=Main.new
game.start_game
game.play_game


