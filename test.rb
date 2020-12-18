#bracket method --> useful assigning/reassigning
class Board
    attr_accessor :grid
    def initialize
        @grid = Array.new(3){[]} #returns grid upon intialization
    end

    def [](row, col)
        @grid[row][col]
    end

    def []=(row, col, value)
        @grid[row][col] = value #returns value
    end
end
    
board = Board.new
board.grid[2][0] = "foo"
p board.grid
p board[2, 0]
board.[]=(2,0,"bar")
p board.[](2,0)
board[2, 0]= "baz"
p board[2,0]