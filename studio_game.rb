class Player
  def initialize(player_name, health=100)
    @player_name = player_name.capitalize
    @health = health
  end

  def to_s
    "#{@player_name} has a health of #{@health}"
  end

  def w00t
    @health +=15
    puts "#{@player_name} got wooted!"
  end
  
  def blam
    @health -=15
    puts "#{@player_name} got blammed!"
  end

end

player1 = Player.new("steven", 100)
puts player1

player1 = Player.new("dylan", 100)
player1.blam
puts player1

player1 = Player.new("newbie", 100)
puts player1
