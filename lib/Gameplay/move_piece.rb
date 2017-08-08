require_relative '../Board/board'
require_relative '../Gameplay/main'
class Piece_Actions

  module Move_On_Board
    attr_reader :RIGHT, :LEFT, :TOP_LEFT, :TOP_RIGHT,:BOTTOM_LEFT,:BOTTOM_RIGHT,:UP,:DOWN
    RIGHT=0
    TOP_RIGHT=1
    TOP_LEFT=2
    BOTTOM_LEFT=3
    BOTTOM_RIGHT=4
    LEFT=5
    UP=6
    DOWN=7


    def self.move (x,y,number_of_times,direction)
      local_x=x
      local_y=y
      (1..number_of_times).each do
        case direction
          when UP
            local_x+=1
          when DOWN
            local_x-=1
          when LEFT
            local_y-=1
          when RIGHT
            local_y+=1
        end
        if !Board.is_spot_avaliable?(Main.get_current_player,local_x,local_y)
          return [nil,nil]
        elsif !Board.is_spot_avaliable?(Main.get_waiting_player,local_x,local_y)
          return [-1,-1]
        end
      end
      return [local_x,local_y]
    end

    def self.move_diagonal(x,y,number_of_times,direction)
      local_x=x
      local_y=y
      (1..number_of_times).each do
        case direction
          when TOP_RIGHT
            local_x+=1
            local_y+=1
          when TOP_LEFT
            local_x-=1
            local_y+=1
          when BOTTOM_LEFT
            local_x-=1
            local_y-=1
          when BOTTOM_RIGHT
            local_x+=1
            local_y-=1
        end
        if !Board.is_spot_avaliable?(Main.get_current_player,local_x,local_y)
          return [nil,nil]
        elsif !Board.is_spot_avaliable?(Main.get_waiting_player,local_x,local_y)
          return [-1,-1]
        end
      end
      return [local_x,local_y]
    end
  end

end