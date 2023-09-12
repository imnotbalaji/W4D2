require_relative "piece.rb"

class Pawn < Piece
    def moves

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

end