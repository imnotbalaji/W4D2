require_relative "board.rb"
require_relative "piece.rb"
require_relative "rook.rb"
require_relative "slideable.rb"
require_relative "bishop.rb"
require_relative "queen.rb"
require_relative "knight.rb"
require_relative "king.rb"
require_relative "pawn.rb"
require_relative "nullpiece.rb"


class Board
    def initialize
        @rows = Array.new(8) {Array.new(8)}    
        back_row = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]
        back_row.each.with_index do |piece,index|
            rows[0][index] = piece.new(:W,self,[0,index])
            rows[7][index] = piece.new(:B,self,[7,index])
        end 
        (0..7).each do |index|
            rows[1][index] = Pawn.new(:W,self,[1,index])
            rows[6][index] = Pawn.new(:B,self,[6,index])
        end 
        (2..5).each do |row|
            (0..7).each do |col|
                rows[row][col] = NullPiece.instance
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
        if self[start_pos] == NullPiece.instance
            raise RuntimeError.new("There is no piece at start_pos")
        end

        if !valid_pos?(end_pos)
            raise RuntimeError.new("There is position at #{end_pos}")
        end

        self[end_pos] = self[start_pos]
        self[start_pos] = NullPiece.instance
    end

    def valid_pos?(pos)
        row, col = pos
        return true if row >= 0 && row < 8 && col >= 0 && col < 8
        
    end

    private
    attr_reader :rows


end
