require_relative 'game'

player1 = Player.new("steven", 100)
player2 = Player.new("dylan", 100)
player3 = Player.new("newbie", 100)

knuckleheads = Game.new("Knuckleheads")
load_players("players.csv")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play(3)
knuckleheads.print_stats

loop do
  puts "How many game rounds? ('quit' to exit)?"
  answer = gets.chomp.downcase
  if answer.match(/^\d+$/)
    knuckleheads.play(answer.to_i)
    knuckleheads.print_stats
  elsif answer == 'quit' || answer == 'exit'
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

