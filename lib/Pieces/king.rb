require_relative '../Pieces/piece'

class King < Piece

  def initialize(id,color,x_coord,y_coord,piece_string)
    super(id,color,x:x_coord,y:y_coord)
    @piece_on_board=piece_string
  end


  def valid_for_king?(to_x, to_y, straight_directions,diagonal_directions)

    result_coord=[to_x, to_y]

    straight_directions.each do |dir|
      validate=king_direction_movement( dir, false)
      if validate == result_coord
        return true
      elsif validate ==[nil, nil] or validate == [-1, -1]
        return false
      end
    end

    diagonal_directions.each do |dir|
      validate=king_direction_movement(dir, true)
      if validate == result_coord
        return true
      elsif validate == [nil, nil] or validate == [-1, -1]
        return false
      end
    end
    return false
  end


  def get_piece
    return @piece_on_board
  end
  def king_direction_movement(direction, is_diagonal)
    result=[]
    if is_diagonal
      result= Move_On_Board::move_diagonal(self.get_x, self.get_y, 1, direction)
    else
      result= Move_On_Board::move(self.get_x, self.get_y, 1, direction)
    end
    return result
  end

end
