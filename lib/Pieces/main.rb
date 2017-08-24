require_relative '../Player/player_white'
require_relative '../Pieces/rook'
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

  MAX_SIZE=7


  def self.get_max_size
    return MAX_SIZE
  end


  def self.set_players
    @@current_player=Player.new('W')
    @@waiting_player=Player.new('B')
  end



  def self.switch_turns(curr_player,next_player)
    @@current_player=curr_player
    @@waiting_player=next_player
  end

  def self.get_turn_coordinates
    input=OpenStruct.new

    catch :input_loop do
      loop do
        print "Enter id of piece:"
        input.id=gets.chomp
        @@current_player.get_current_pieces.each do |piece|
          if piece[0].eql? input.id
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



  def self.play_game(input)
    factory=Piece_Factory.new(input.piece)
    if factory.is_move_valid?( input.x, input.y)
      Main.current_player.move_piece(input.piece,x:Integer(input.x),y:Integer(input.y))
    else
      puts "nope"
    end


    puts input
  end

  def self.current_player
    return @@current_player
  end

  def self.waiting_player
    return @@waiting_player
  end


end


Main.set_players
Board.set_up_game(Main.current_player,Main.waiting_player)
Board.print_coords
input=OpenStruct.new
input.piece=Pawn.new("wpawn10",Color::WHITE,1,0,Print::White::PAWN)
input.x=3
input.y=0

  Main.play_game(input)
  Board.display_board


  puts "   ===   "

 # Main.switch_turns(Main.waiting_player,Main.current_player)


  input2=OpenStruct.new
  input2.piece=Rook.new("wrook00",Color::WHITE,0,0,Print::White::ROOK)
  input2.x=2
  input2.y=0

Main.play_game(input2)
Board.display_board





