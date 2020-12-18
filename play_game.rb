require_relative "board"
require_relative "Card"
require_relative "Game"

g = Game.new
while g.over? == false
    g.display
    g.prompt
    g.reveal
    g.display
    g.prompt
    g.reveal
    g.display
    g.make_guess
    g.display
end
g.end_game
