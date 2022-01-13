require_relative 'player'
require_relative 'treasure_trove'

describe Player do
  before do
    @initial_health = 150
    @player = Player.new("steven", @initial_health)
  end
  it "has a capitalized name" do
    expect(@player.player_name).to eq("Steven")
  end
  it "has an initial health" do
    expect(@player.health).to eq(150)
  end
  it "has a string representation" do
    expect(@player.to_s).to eq("Steven has a health of 150 and a score of 156")
  end
  it "computes a score as the sum of its health and length of name" do
    expect(@player.score).to eq(150 + 6)
  end
  it "increases health by 15 when w00ted" do
    @player.w00t
    expect(@player.health).to eq(@initial_health + 15)
  end
  it "decreases health by 10 when blammed" do
    @player.blam
    expect(@player.health).to eq(@initial_health - 15)
  end

  context "testing whether a player is strong or not with a health score of 150" do
    before do
      @player = Player.new("Ryan", 150)
    end
    it "shows that player is a strong one" do
      expect(@player.strong?).to eq(true)
    end
  end

  context "testing whether a player is strong or not with a health score of 100" do
    before do
      @player = Player.new("cyndy", 100)
    end
    it "shows that player is not a strong one" do
      expect(@player.strong?).to eq(false)
    end
  end

  it "computes points as the sum of all treasure points" do
    @player.points.should == 0
  
    @player.found_treasure(Treasure.new(:hammer, 50))
  
    @player.points.should == 50
  
    @player.found_treasure(Treasure.new(:crowbar, 400))
  
    @player.points.should == 450
  
    @player.found_treasure(Treasure.new(:hammer, 50))
  
    @player.points.should == 500
  end
end