class Player
  attr_accessor :health, :player_name

  def initialize(player_name, health=100)
    @player_name = player_name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def to_s
    "#{@player_name} has a health of #{@health}, #{points} points, and a score of #{score}"
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
    @health + points
  end

  def strong?
    if @health > 100
      true
    else
      false
    end
  end
  
  def <=>(other)
    other.score <=> score
  end

  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
    puts "#{@player_name} found a #{treasure.name} worth #{treasure.points} points!"
    puts "#{@player_name}'s treasures: #{@found_treasures}"
  end

  def points
    @found_treasures.values.reduce(0, :+)
  end
end