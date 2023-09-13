class Piece
    def initialize(color,board,position)
        @color = color # Color (White or black)
        @board = board # Board class 
        @pos = position
    end 

    def to_s 
        self.class.to_s[0..3]
    end

    def empty?
        self.class == NullPiece
    end

    def pos=(val)
        @pos = val
    end

    def inspect 
        "#{to_s}"
    end

    attr_accessor :color, :pos, :board
end