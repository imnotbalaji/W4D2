require_relative "piece.rb"

class Pawn < Piece
    def moves
        validmoves = []
	    validmoves += forwardsteps
	    validmoves += side_attacks
    end

    def at_start_row?
        if self.color == :W && self.pos[0] == 1
            return true
        elsif self.color == :B && self.pos[0] == 6
            return true
        end
        false
    end

    def forward_dr
        if self.color == :W
            return 1
        elsif self.color == :B
            return -1
        end
    end


    def forward_steps
        valid_moves = []
        vector = [0,0]
        vector[-1] = forward_dr
        start_row, start_col = self.pos
        if self.start_row?
            next_row = start_col + vector[0]
            next_col = start_row + vector[-1]
            if board[[next_row,next_col]] == nil
                valid_moves << [next_row, next_col]
                next_row += vector[0]
                next_col += vector[-1]
                valid_moves << [next_row, next_col] if board[[next_row,next_col]] == nil
            end
        else
            next_row = start_col + vector[0]
            next_col = start_row + vector[-1]
            if board.valid_pos?([next_row, next_col])
                valid_moves << [next_row, next_col] if board[[next_row,next_col]] == nil
            end
        end
        valid_moves
    end
    
    def side_attacks
        validmoves = []
        forward_vector = forward_dr
    
    end
end