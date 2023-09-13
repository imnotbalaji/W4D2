require_relative "board.rb"
require_relative "piece.rb"
require_relative "rook.rb"
require_relative "slideable.rb"
require_relative "bishop.rb"
require_relative "queen.rb"
require_relative "knight.rb"
require_relative "king.rb"
require_relative "pawn.rb"

b = Board.new 

# # test slideable 
# rook = Rook.new(:W, b, [2,4]) 
# # p rook.moves # works

# bishop = Bishop.new(:W, b, [2,2])
# # p bishop.moves # works

# queen = Queen.new(:W, b, [2,3])
# #p queen.moves
# # slideable works

# # test stepable
# knight = Knight.new(:W, b, [2,3])
# p knight.moves
# # p knight works 

# king = King.new(:W,b,[2,4])
# p king.moves



# pawn = Pawn.new(:B,b, position_1 )

# p pawn.moves