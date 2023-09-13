require_relative "board.rb"
require_relative "piece.rb"
require_relative "rook.rb"
require_relative "slideable.rb"
require_relative "bishop.rb"
require_relative "queen.rb"
require_relative "knight.rb"
require_relative "king.rb"
require_relative "pawn.rb"
require_relative "display.rb"

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

d = Display.new(b)

# result = nil
# until result

#     d.render
#     result = d.cursor.get_input
# end
# result

# p b.in_check(:W)
# p b.in_check(:B)

b.move_piece([1,1],[3,1]) # white move 1 
# d.render

b.move_piece([6,3],[4,3]) # black move 1 
b.move_piece([1,2],[2,2]) # white move 2
b.move_piece([7,4],[3,0])  # black_move 2
# b.move_piece([1,4],[2,4])
# b.move_piece([7,4],[4,7])

d.render

# p b[[4,7]].moves
# p b[[4,7]].class
p b.in_check(:W)
p b.checkmate?(:W)
# p b.in_check(:B)