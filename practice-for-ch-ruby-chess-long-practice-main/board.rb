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
        #debugger
        self[end_pos] = self[start_pos]
        self[start_pos] = NullPiece.instance
        self[end_pos].pos = end_pos
    end

    def valid_pos?(pos)
        row, col = pos
        return true if row >= 0 && row < 8 && col >= 0 && col < 8
        
    end

    def in_check(color)
        # find the position of the king of this color on the board ("white")
        king_position = nil
        rows.each do |row|
            row.each do |piece|
                king_position = piece.pos if piece.class == King && piece.color == color 
            end          
        end 
        rows.each do |row|
            row.each do |piece|
                if piece.class != NullPiece && piece.color != color
                    piece_moves = piece.moves
                    #debugger
                    if piece_moves.include?(king_position) 
                        return true 
                    end
                end 
            end 
        end 
        return false
    end 

    def checkmate?(color)
        if in_check(color)
            rows.each do |row|
                row.each do |piece|
                    if piece.color == color
                        if piece.valid_moves.length != 0
                            return false
                        end
                    end
                end
            end
            return true
        end
        false
    end


    attr_reader :rows


end
