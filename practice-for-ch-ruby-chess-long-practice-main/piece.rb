class Piece
    def initialize(color,board,position)
        @color = color # Color (White or black)
        @board = board # Board class 
        @pos = position
    end 

    def to_s 
        self.class.to_s[0..2]
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

    def deep_copy
        ## Create a copy of the board
        b_copy = Board.new
        # debugger
        board.rows.each.with_index do |row,row_index|
            row.each.with_index do |piece,col_index|
                b_copy[[row_index,col_index]] = Piece.new(color,b_copy,pos)
            end 
        end 
        return b_copy
    end 

    def move_into_check?(end_pos)
        b_copy = deep_copy
        b_copy.move_piece(pos,end_pos)
        if b_copy.in_check(color)
            return true 
        else 
            return false
        end 
    end 

    def valid_moves
        valid_moves = []
        moves.each do |move|
            valid_moves << move if !move_into_check?(move)
        end 
        return valid_moves
    end 

    attr_accessor :color, :pos, :board
end