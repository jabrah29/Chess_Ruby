require_relative '../Board/board'

  module Move_On_Board
    attr_reader :RIGHT, :LEFT, :TOP_LEFT, :TOP_RIGHT,:BOTTOM_LEFT,:BOTTOM_RIGHT,:UP,:DOWN ,:KNIGHT_DOWN_LEFT,:KNIGHT_DOWN_RIGHT
    RIGHT=0
    TOP_RIGHT=1
    TOP_LEFT=2
    BOTTOM_LEFT=3
    BOTTOM_RIGHT=4
    LEFT=5
    UP=6
    DOWN=7
    KNIGHT_UP_LEFT=8
    KNIGHT_LEFT_UP=9
    KNIGHT_UP_RIGHT=10
    KNIGHT_RIGHT_UP=11
    KNIGHT_DOWN_LEFT=12
    KNIGHT_LEFT_DOWN=13
    KNIGHT_DOWN_RIGHT=14
    KNIGHT_RIGHT_DOWN=15


    def self.move (x,y,number_of_times,direction)
      local_x=x
      local_y=y
      (1..number_of_times).each do
        case direction
          when UP
            local_y+=1
          when DOWN
            local_y-=1
          when LEFT
            local_x-=1
          when RIGHT
            local_x+=1
        end
        check_for_collisions(local_x,local_y)
      end
      return [local_x,local_y]
    end

    def self.move_knight(x,y,direction)
      local_x=x
      local_y=y
      case direction
        when KNIGHT_UP_LEFT
          local_x-=1
          local_y+=2
        when KNIGHT_LEFT_UP
          local_x-=2
          local_y+=1
        when KNIGHT_DOWN_RIGHT
          local_x+=1
          local_y-=2
        when KNIGHT_RIGHT_DOWN
          local_x+=2
          local_y-=1
        when KNIGHT_DOWN_LEFT
          local_x-=1
          local_y-=2
        when KNIGHT_LEFT_DOWN
          local_x-=2
          local_y-=1
        when KNIGHT_RIGHT_UP
          local_x+=2
          local_y-=1
        when KNIGHT_UP_RIGHT
          local_x+=1
          local_y+=2

      end
      check_for_collisions(local_x,local_y)
      return [local_x,local_y]
    end


    def self.check_for_collisions(local_x,local_y)
      if !Board.is_spot_avaliable?(Main.get_current_player,local_x,local_y)
        return [nil,nil]
      elsif !Board.is_spot_avaliable?(Main.get_waiting_player,local_x,local_y)
        return [-1,-1]
      end
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
      check_for_collisions(local_x,local_y)
      end
      return [local_x,local_y]
    end
  end

