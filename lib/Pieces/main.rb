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
require_relative '../Gameplay/valid_conditions'
require_relative 'piece_factory'
require_relative '../Board/board'
require 'ostruct'


class Main


  @@current_player
  @@waiting_player

  MAX_SIZE=7


  def self.get_max_size
    return MAX_SIZE
  end
  def self.get_player_names
    puts "--Welcome--"
    puts "Enter Player White Name"
    name=gets.chomp
    puts "Enter Player Black Name"
    name2=gets.chomp
    return [name,name2]
  end

  def self.set_players(*names)
    @@current_player=Player_White.new(names[0])
    @@waiting_player=Player_Black.new(names[1])
  end




  def get_turn_coordinates
    input=OpenStruct.new
    catch :input_loop do
      loop do
        print "Enter id of piece:"
        input.id=gets.chomp
        @@current_player.get_current_pieces.each do |piece|
          if piece[0].eql? input.id
            puts "found"
            input.piece=piece[1]
            break
          end
        end
        print "Enter new x :"
        input.x=gets.chomp
        print "Enter new y :"
        input.y= gets.chomp

        if (input.x.to_s.to_i < 0) or (input.x.to_s.to_i > 7) or (input.y.to_s.to_i < 0 or input.y.to_s.to_i > 7)
          puts "invalid"
        else
          throw :input_loop
        end

      end
    end

    return input
  end



  def play_game(input)
    factory=Piece_Factory.new(input.piece)
    if factory.is_move_valid?( input.x, input.y)
      puts "yes"
    else
      puts "nope"
    end


    puts input
  end

  def self.get_current_player
    return @@current_player
  end

  def self.get_waiting_player
    return @@waiting_player
  end


end



