require_relative 'lib/game_factory.rb'

factory = GameFactory.new
game = factory.make_game
game.play_game