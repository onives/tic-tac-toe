class GameFactory 
    def make_game
        Game.new(board: Board.new, player: Player.new('X'), input: $stdin, output: $stdout)
    end
end