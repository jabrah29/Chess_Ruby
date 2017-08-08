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
end

