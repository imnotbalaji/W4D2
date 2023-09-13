require_relative "piece.rb"

class Pawn < Piece
    def moves
        valid_moves = []
	    valid_moves += forward_steps
	    valid_moves += side_attacks
        return valid_moves
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
        vector[0] = forward_dr
        start_row, start_col = self.pos
        if self.at_start_row?
            next_row = start_row + vector[0]
            next_col = start_col + vector[-1]
            if board[[next_row,next_col]] == NullPiece.instance
                valid_moves << [next_row, next_col]
                next_row += vector[0]
                next_col += vector[-1]
                valid_moves << [next_row, next_col] if board[[next_row,next_col]] == NullPiece.instance
            end
        else
            next_row = start_row + vector[0]
            next_col = start_col + vector[-1]
            if board.valid_pos?([next_row, next_col])
                valid_moves << [next_row, next_col] if board[[next_row,next_col]] == NullPiece.instance
            end
        end
        valid_moves
    end
    
    def side_attacks
        valid_moves = []
        start_row, start_col = self.pos
        cross_attack = []
        cross_attack << [forward_dr,-1]
        cross_attack << [forward_dr,1]
        cross_attack.each do |attack|
            next_row = start_row + attack[0]
            next_col = start_col + attack[1]
           
            if board.valid_pos?([next_row,next_col]) && board[[next_row,next_col]] != NullPiece.instance
                print next_row 
                print next_col
                valid_moves << [next_row,next_col] if board[[next_row,next_col]].color != self.color
            end 
        end 
        valid_moves
    end 
       
end