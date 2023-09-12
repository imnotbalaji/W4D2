module Slideable
    HORIZONTAL_DIRS = [[0,1], [1,0], [0,-1],[-1,0]]
    DIAGONAL_DIRS = [[1,1],[1,-1],[-1,1],[-1,1]]
    attr_reader :HORIZONTAL_DIRS, :DIAGONAL_DIRS

    def move_dirs
    
        # [1,0] if rook
        # [0,1] if bishop

        # [1,1] if queen        
    end 
    def moves 
       valid_directions=  []
       valid_moves = []

       valid_directions += HORIZONTAL_DIRS  if move_dirs[0] = 1
       valid_directions += DIAGONAL_DIRS if move_dirs[1] = 1 

        valid_directions.each do |direction|
            dx, dy = direction
            valid_moves += grow_unblocked_moves_in_dir(dx,dy)
        end 
        return valid_moves
    end 

    def grow_unblocked_moves_in_dir(dx,dy)
        start_row, start_column = pos 
        valid_moves = []
        start_row += dx
        start_column += dy

        while board[[start_row,start_column]] != nil
            valid_moves << [start_row,start_column] 
            start_row += dx
            start_column += dy
        end 
        
        # if !board[[start_row,start_column]] && board[[start_row,start_column]].color != self.color
        #     valid_moves << [start_row,start_column]
        # end 
        return valid_moves
    end 
end 