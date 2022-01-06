require_relative 'player'
require_relative 'die'
require_relative 'game_turn'

class Game
  attr_reader :title
  
  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play(rounds)
    puts "There are #{@players.count} players in #{@title}"
    1.upto(rounds) do |round|
      puts "This is round: #{round}"
      @players.each do |player|
        GameTurn.take_turn(player)
      end
    end
  end

  def print_stats
    strong, wimpy = @players.partition { |p| p.strong? }
    puts "Strong Players:"
    strong.each {|p| puts "#{p.player_name} #{p.health}"}
    puts "Wimpy Players:"
    wimpy.each {|p| puts "#{p.player_name} #{p.health}"}
  end
end