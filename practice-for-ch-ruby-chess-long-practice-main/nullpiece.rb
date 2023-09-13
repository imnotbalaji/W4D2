require "singleton"
require_relative "piece.rb"

class NullPiece < Piece
    include Singleton 

    def initialize
        super(nil,nil,nil)
    end 

    def moves

    end 
    def symbol 
    end 
    

end 