require_relative 'player'
require_relative 'die'

class Game
  attr_reader :title
  
  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play
    puts "There are #{@players.count} players in #{@title}"
    @players.each do |player|
      die = Die.new
      number_rolled = die.roll

      if number_rolled < 3
        player.blam
      elsif number_rolled < 5
        puts "#{player.player_name} skips"
      else
        player.w00t
      end
    end
  end
end