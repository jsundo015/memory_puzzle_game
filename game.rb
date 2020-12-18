require_relative "board"
require_relative "Card"
require "byebug"

class Game
    attr_accessor :guesses

    def initialize
        @board = Board.new
        @board.populate
        @guesses = []
    end

    def display
        @board.render
    end

    def prompt
        puts "Type in a card position to flip it!"
        input = gets

        nums, pos = '0123456789', []
        input.each_char{|char| pos << char.to_i if nums.include? char}

        if pos.length != 2 or  @board[pos[0], pos[1]].up? == true
            puts "That's an invalid choice! Try again."
            self.prompt
        else
            @guesses << pos
        end
    end

    def reveal
        row, col = @guesses[-1][0], @guesses[-1][1]
        @board[row, col].reveal
    end

    def flip_down
        @guesses.each do |pos|
            @board[pos[0], pos[1]].hide
        end
        @guesses = []
    end

    def make_guess
        row1, col1 = @guesses[0][0], @guesses[0][1]
        row2, col2 = @guesses[1][0], @guesses[1][1]
        if @board[row1, col1].isSame?(@board[row2, col2])
            @guesses = []
            puts "Great job! It's a match!"
        else
            self.flip_down 
    
        end
    end
    
    def new_game
        Game.new
    end

    def end_game
        puts "You win!" if self.over?    
    end

    def over?
        return @board.won?
    end

end