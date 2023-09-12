require_relative "piece.rb"

class Board
    def initialize
        @rows = Array.new(8) {Array.new(8)}

        (0..1).each do |row|
            (0..7).each do |col|
                @rows[row][col] = Piece.new(:W, self,[row,col])
            end
        end

        (-2..-1).each do |row|
            (0..7).each do |col|
                @rows[row][col] = Piece.new(:B, self,[row,col])
            end
        end
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        if self[start_pos] == nil
            raise RuntimeError.new("There is no piece at start_pos")
        end

        if !valid_pos?(end_pos)
            raise RuntimeError.new("There is position at #{end_pos}")
        end

        self[end_pos] = self[start_pos]
        self[start_pos] = nil
    end

    def valid_pos?(pos)
        row, col = pos
        return true if row >= 0 && row < 8 && col >= 0 && col < 8
        
    end


end
