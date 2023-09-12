class Piece
    def initialize(color,board,position)
        @color = color # Symbol (White or black)
        @board = board # Board class 
        @pos = position
    end 

   

    def inspect 
        "#{color}"
    end

    attr_accessor :color, :pos, :board
end