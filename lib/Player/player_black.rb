class Player_Black
  @@CURRENT_PIECES=[]
  def initialize(name)
    @name=name
    @dead_pieces=[]
    @list_of_moves=[]
  end

  def get_current_pieces
    return @@CURRENT_PIECES
  end


  def self.initialize_pieces(list)
    @@CURRENT_PIECES=list
  end

end