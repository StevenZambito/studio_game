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

  def strong?
    if @health > 100
      true
    else
      false
    end
  end
end