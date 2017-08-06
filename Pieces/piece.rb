class Piece

  @@color


  module Perform_Actions
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
      number_of_times.loop do
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
      end
      return [local_x,local_y]
    end

    def self.move_diagonal(x,y,number_of_times,direction)
      local_x=x
      local_y=y
      number_of_times.loop do
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
      end
      return [local_x,local_y]
    end


  end


  def initialize(set_color,**coords)
    @@color=set_color
    @location_on_board={
        "x"=>coords[x],
        "y"=>coords[y]
    }
    @is_alive=true
  end


  def move(x,y)
    @location_on_board["x"],@location_on_board["y"]=x,y
  end


  def is_valid_move?(x,y)
    raise 'this method should be overridden by child piece'
  end



end