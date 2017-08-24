require_relative '../Board/board'
class Player

  def initialize(team)
    @dead_pieces=[]
    @list_of_moves=[]
    @current_pieces=[]
    @color=team
  end

  def get_current_pieces
    return @current_pieces
  end

  def set_current_pieces(list)
    @current_pieces=list
  end

  def initialize_pieces(list)
    @current_pieces=list
  end

  def get_color
    @color
  end

  def move_piece(piece,**new_location)
      Board.get_chess_board[new_location[:x]][new_location[:y]]= piece
      Board.get_chess_board[piece.get_x][piece.get_y]='.'
      @current_pieces[piece.get_id].move_to(new_location)
  end





end