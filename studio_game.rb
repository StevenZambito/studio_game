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
      puts player
    end

    @players.each do |player|
      player.blam
      player.w00t
      player.w00t
      puts player
    end
  end

end


player1 = Player.new("steven", 100)
player2 = Player.new("dylan", 100)
player3 = Player.new("newbie", 100)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play

