require_relative 'game'

describe Game do

  before do
    @game = Game.new("Knuckleheads")

    @initial_health = 100
    @player = Player.new("moe", @initial_health)

    @game.add_player(@player)
  end

    it "woots the player when a high number is rolled" do
      allow_any_instance_of(Die).to receive(:roll).and_return(5)
      @game.play(2)
      expect(@player.health).to eq(@initial_health + 15 * 2)
    end

    it "skips the player when a medium number is rolled" do
      allow_any_instance_of(Die).to receive(:roll).and_return(4)
      @game.play(2)
      expect(@player.health).to eq(@initial_health)
    end

    it "blams the player when a low number is rolled" do
      allow_any_instance_of(Die).to receive(:roll).and_return(1)
      @game.play(2)
      expect(@player.health).to eq(@initial_health - 15 * 2)
    end

    context "in a collection of players" do
      before do
        @player1 = Player.new("moe", 100)
        @player2 = Player.new("larry", 200)
        @player3 = Player.new("curly", 300)
    
        @players = [@player1, @player2, @player3]
      end
    
      it "is sorted by decreasing score" do
        @players.sort.should == [@player3, @player2, @player1]
      end
    end

    it "assigns a treasure for points during a player's turn" do
      game = Game.new("Knuckleheads")
      player = Player.new("moe")
    
      game.add_player(player)
    
      game.play(1)
    
      player.points.should_not be_zero
    
      # or use alternate expectation syntax:
      # expect(player.points).not_to be_zero
    end
end
