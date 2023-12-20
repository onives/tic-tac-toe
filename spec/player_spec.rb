require './lib/player.rb'
require 'stringio'

describe Player do
    describe "#get_player_input" do 
        it "exists" do 
            subject = Player.new
            subject.get_player_input
        end
    end
end