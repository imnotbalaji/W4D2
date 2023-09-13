module Stepable

    def moves
        valid_moves = []
        move_directions = move_diffs

        move_directions.each do |direction|
            start_row, start_col = pos
            dx, dy = direction
            
            start_row += dx
            start_col += dy

            if board.valid_pos?([start_row, start_col])
                if board[[start_row, start_col]] == NullPiece.instance || board[[start_row, start_col]].color != self.color
                    valid_moves << [start_row, start_col]
                end
            end
        end 

        return valid_moves

    end

    def move_diffs
        knight_moves = [[-1,-2],[-2,-1],[-2,1],[-1,2],[1,2],[2,1],[2,-1],[1,-2]]
        king_moves = [[1,0],[-1,0],[0,-1],[0,1],[1,1],[-1,-1],[-1,1],[1,-1]]
    end

end