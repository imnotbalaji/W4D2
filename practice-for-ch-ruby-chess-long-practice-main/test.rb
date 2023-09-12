require_relative "board.rb"
require_relative "piece.rb"
require_relative "rook.rb"
require_relative "slideable.rb"

b = Board.new 

rook = Rook.new(:W, b, [2,4]) 


# p rook.HORIZONTAL_DIRS

p rook.moves