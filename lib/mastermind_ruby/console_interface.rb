trap 'SIGINT' do
  puts "\r\rThe game was interrupted :("
  exit 130
end

module MastermindRuby
  # The console interface represents the game
  # interacting with the UI (in that case a terminal window)

  # Must have methods
  # * :read_playername
  # * :read_next_guess
  # * :display_welcome_message
  # * :display_assessment
  # * :display_invalid_code
  class ConsoleInterface

    # Method which reads the playername
    # Return the playername as string
    def read_playername
      # User inital input
      print 'Please enter a name: '
      gets.chomp
    end

    # Method which is called when the next turn is initiated
    # Return next guess as Code object
    # Params:
    # +try_count+:: what number of guess
    def read_next_guess(try_count)
      print "#{try_count}: "
      MastermindRuby::Code.parse(gets.strip)
    end

    # Method which is called when the game is initiated to display the game has been started
    # Params:
    # +playername+:: the playername which was read before with :read_playername
    def display_welcome_message(playername)
      puts '-------- Mastermind Ruby Project -------'
      puts "Hello #{playername}, your code is generated!"
      puts "Avaliable Characters:\t#{MastermindRuby::Code::AVAILABLE_CHARACTERS.join("\t")}"
    end

    # Method which is called when the guess is evaluated
    # Params:
    # +result+:: the result (e.g. BBW-, ATTENTION: Code object)
    def display_assessment(result)
      puts (result)
    end

    # Method which is called when the guess was not a valid code
    def display_invalid_code
      puts 'Invalid code'
    end

    # Method which is called when the game is ended
    # Params:
    # +try_count+:: how many times guessed until finished
    def display_end_game(try_count)
      puts "Congrats! You made it with #{try_count} tries."
    end
  end
end
