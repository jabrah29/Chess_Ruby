class Board

  def self.initialize_pieces

  end


  def self.is_piece_at_location?(player, **at_coordinates)

    player.get_current_pieces.each do |piece|
      if piece[1].get_x == at_coordinates[:x] and piece[1].get_y == at_coordinates[:y]
        return true
      end
    end
    return false
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
      when Piece_Actions::Move_On_Board::UP
        times=to_y-piece.get_y
      when Piece_Actions::Move_On_Board::DOWN
        times=piece.get_y-to_y
      when Piece_Actions::Move_On_Board::RIGHT
        times=to_x-piece.get_x
      when Piece_Actions::Move_On_Board::LEFT
        times=piece.get_x - to_x
        #TODO: add for diagonales
    end
    return times
  end
end

