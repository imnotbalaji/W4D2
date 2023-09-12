require_relative "piece.rb"
require_relative "slideable.rb"

class Bishop < Piece
    include Slideable
    
    def move_dirs
        [0,1]
    end 
end 