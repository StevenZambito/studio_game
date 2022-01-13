require_relative 'player'
require_relative 'die'
require_relative 'treasure_trove'


module GameTurn
  def self.take_turn(player)
    die = Die.new
    number_rolled = die.roll

    if number_rolled < 3
      player.blam
    elsif number_rolled < 5
      puts "#{player.player_name} skips"
    else
      player.w00t
    end

    treasure = TreasureTrove.random
  end
end