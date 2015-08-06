require_relative 'game'

# User inital input
print "Please enter a name: "
playername = gets.chomp

# Game intialization
game = Game.new(playername)

# Welcome input..
puts "-------- Mastermind Ruby Project -------"
puts "Hello #{playername}, your code is generated!"
puts "Avaliable Characters:\t#{Game::AVAILABLE_CODES.join("\t")}"

# Game
until game.game_finished
  print "#{game.try_count}: "
  try = gets.strip
  begin
    puts game.guess(try)
  rescue ArgumentError => e
    puts e
  end
end

# Final output
puts "Congrats! You made it with #{game.try_count} tries."
