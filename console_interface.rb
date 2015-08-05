trap 'SIGINT' do
  puts "\r\rThe game was interrupted :("
  exit 130
end

class ConsoleInterface
  def read_playername
    # User inital input
    print 'Please enter a name: '
    gets.chomp
  end

  def read_next_guess(try_count)
    print "#{try_count}: "
    Code.parse(gets.strip)
  end

  def display_welcome_message(playername)
    # Welcome input..
    puts '-------- Mastermind Ruby Project -------'
    puts "Hello #{playername}, your code is generated!"
    puts "Avaliable Characters:\t#{Code::AVAILABLE_CHARACTERS.join("\t")}"
  end

  def display_assessment(result)
    puts (result)
  end

  def display_invalid_code
    puts 'Invalid code'
  end

  def display_end_game(tries)
    puts "Congrats! You made it with #{tries} tries."
  end
end
