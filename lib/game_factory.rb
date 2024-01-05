require_relative 'game.rb'
require_relative 'board.rb'
require_relative 'player.rb'


class GameFactory 
    def make_game
        Game.new(Board.new, [Player.new('X'), Player.new('O')], $stdin, $stdout)
    end
end