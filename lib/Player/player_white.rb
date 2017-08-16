require_relative '../Board/board'
class Player_White

  @@CURRENT_PIECES=[]
  def initialize(name)
    @name=name
    @dead_pieces=[]
    @list_of_moves=[]
  end

  def get_current_pieces
    return @@CURRENT_PIECES
  end

  def set_current_pieces(list)
    @@CURRENT_PIECES=list
  end

  def self.initialize_pieces(list)
    @@CURRENT_PIECES=list
  end


  def move_piece(piece,**new_location)
    
  end





end