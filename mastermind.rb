require_relative 'game'

# User inital input
print "Please enter a name: "
playername = gets.chomp

# Game intialization
game = Game.new(playername)
game.on_start do
  print "#{game.try_count}: "
  code = Code.parse(gets.strip)
end
game.on_end do
  puts "Congrats! You made it with #{game.try_count} tries."
end

# Welcome input..
puts "-------- Mastermind Ruby Project -------"
puts "Hello #{playername}, your code is generated!"
puts "Avaliable Characters:\t#{Code::AVAILABLE_CHARACTERS.join("\t")}"

# Game
until game.finished?
  print "#{game.try_count}: "
  code = Code.parse(gets.strip)
  if code.valid?
    puts game.guess(code)
  else
    puts "Invalid code"
  end
end

# Final output
