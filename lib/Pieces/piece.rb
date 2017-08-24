require_relative '../Player/color'

class Piece

  @color
  @id



  def initialize(id,set_color,**coords)
    @color=set_color
    @location_on_board={
        "x"=>coords[:x],
        "y"=>coords[:y]
    }
    @is_alive=true
    @id=id
  end


  def get_id
    return @id
  end

  def get_x
    return @location_on_board["x"]
  end


  def get_y
    return @location_on_board["y"]
  end


  def is_white?
    return @color == Color::WHITE
  end

  def is_black?
    return @color == Color::BLACK
  end

  def get_print_piece
    return @pi
  end


  def move_to(**coords)
    @location_on_board["x"],@location_on_board["y"]=coords[:x],coords[:y]
  end


  def is_valid_move?(x,y)
    raise 'this method should be overridden by child piece'
  end



end