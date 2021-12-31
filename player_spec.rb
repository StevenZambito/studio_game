require_relative 'player'

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
end