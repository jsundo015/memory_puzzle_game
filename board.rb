require_relative "Card" #loads and executes all the code from card.rb
require "byebug"

class Board
    attr_accessor :grid
    
    def initialize
        @grid = Array.new(4){[]}
    end

    def [](row, col)
        @grid[row][col]
    end

    def []=(row, col, card)
        @grid[row][col] = card
    end

    def shuffledDeck
        cardVals = ["O", "X", "H", "Z", "B", "S", "W","L",]
        deck = []
        2.times do 
            cardVals.shuffle.map {|val| deck << Card.new(val)}   #key takeaway
        end
        return deck
    end

    def populate()
        deck = self.shuffledDeck
        self.grid.each do |row| 
            4.times do 
                row << deck.pop
            end
        end
    end

    def render
        system("cls")
        columns = '  0 1 2 3'
        puts columns
        grid.each.with_index do |row, idx|
            row_render = [idx]
            row.each.with_index do |card, cols|
                if card.up?
                    row_render << " "
                    row_render << card.face_value 
                    
                end
            end
            puts row_render.join(" ")
        end
    end

    def won?
        count = 0
        grid.each do |row|
            row.each do |card|
                if card.up? == false
                    return false
                end
            end
        end
        return true
    end

end