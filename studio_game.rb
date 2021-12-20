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
puts player1
puts player1.health
puts player1.player_name

player1 = Player.new("dylan", 100)
player1.blam
puts player1

player1 = Player.new("newbie", 100)
puts player1
player1.player_name = "lawrence"
puts player1.player_name


