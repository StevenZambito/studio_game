require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

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
    treasures = TreasureTrove::TREASURES
    puts "There are #{@players.count} players in #{@title}"
    puts "There are #{treasures.size} treasures to be found!"
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end

    1.upto(rounds) do |round|
      puts "This is round: #{round}"
      @players.each do |player|
        GameTurn.take_turn(player)
      end
    end
  end

  def print_name_and_health(p)
    puts "#{p.player_name} #{p.health}"
  end

  def print_stats
    strong, wimpy = @players.partition { |p| p.strong? }
    puts "Strong Players:"
    strong.each {|p| print_name_and_health(p) }
    puts "Wimpy Players:"
    wimpy.each {|p| print_name_and_health(p) }

    @players.each do |player|
      puts "\n#{player.player_name}'s point totals:"
      puts "#{player.points} grand total points"
    end

    puts "Here are the stats!"
    @players.sort.each do |p|
      puts "#{p.player_name}.......... #{p.score}"
    end

    @players.sort.each do |player|
      puts "\n#{player.player_name}'s point totals:"
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.points} grand total points"
    end
  end

  def save_high_scores(to_file="high_scores.txt")
    File.open(to_file, "w") do |file|
      file.puts "#{@title} High Scores:"
    end
  end

  def load_players(file_name)
    File.readlines(file_name).each do |line|
      name, health = line.split(',')
      player = Player.new(name, Integer(health))
      add_player(player)
    end
  end
end