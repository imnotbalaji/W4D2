class Piece
    def initialize(color,board,position)
        @color = color # Color (White or black)
        @board = board # Board class 
        @pos = position
    end 

   

    def inspect 
        "#{color}"
    end

    attr_accessor :color, :pos, :board
end