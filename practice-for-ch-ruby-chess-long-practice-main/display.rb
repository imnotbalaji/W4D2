require_relative "board.rb"
require_relative "cursor.rb"
require "colorize"

class Display

    def initialize(board)
        @board = board
        @cursor = Cursor.new([1,2],board)
    end 

    def render
        system("clear")
        white_square = {background: :white, color: :black }
        black_square = {background: :black, color: :white} 
        cursor_color = {background: :blue, color: :white}
        color = black_square
        @board.rows.each.with_index do |row,row_index|
            if color == black_square
                color = white_square
            else 
                color = black_square
            end 
            row.each.with_index do  |cell,col_index|
                print cell.to_s.colorize(color) if [row_index,col_index] != @cursor.cursor_pos
                print cell.to_s.colorize(cursor_color) if [row_index,col_index] == @cursor.cursor_pos
                print "  "
                if color == black_square
                    color = white_square
                else 
                    color = black_square
                end 
            end 
            print "\n"
    
        end 
        
    end 
    attr_reader :cursor

end 