class Player
  attr_accessor :health, :player_name
  def initialize(player_name, health=100)
    @player_name = player_name.capitalize
    @health = health
  end

  def to_s
    "#{@player_name} has a health of #{@health} and a score of #{score}"
  end

  def w00t
    @health +=15
    puts "#{@player_name} got wooted!"
  end
  
  def blam
    @health -=15
    puts "#{@player_name} got blammed!"
  end

  def score
    @health + @player_name.length
  end

end

player1 = Player.new("steven", 100)
player2 = Player.new("dylan", 100)
player3 = Player.new("newbie", 100)

players = [player1, player2, player3]

puts "There are #{players.count} players in the game"

players.each do |player|
  puts player
  player.w00t
  puts player
end

class Game
  attr_reader :title
  
  def initialize(title)
    @title = title
  end
end

players.pop
player4 = Player.new("Shemp", 90)
players.push(player4)
puts players

