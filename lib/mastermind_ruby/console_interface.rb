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
  # * :read_code_length
  # * :display_welcome_message
  # * :display_assessment
  # * :display_invalid_code
  class ConsoleInterface

    def initialize(io = MastermindRuby::TerminalInputOutput.new)
      @io = io
    end

    # Method which reads the playername
    # Return the playername as string
    def read_playername
      # User inital input
      @io.print 'Please enter a name: '
      @io.gets.chomp
    end

    # Method which reads the code length
    # Return the length of the code you want as an Fixnum
    def read_code_length
      @io.print 'How long should the code be (Hit enter for default): '
      code = @io.gets.strip.to_i
      if code != 0
        code
      else
        4
      end
    end

    # Method which is called when the next turn is initiated
    # Return next guess as Code object
    # Params:
    # +try_count+:: what number of guess
    def read_next_guess(try_count)
      @io.print "#{try_count}: "
      MastermindRuby::Code.parse(@io.gets.strip)
    end

    # Method which is called when the game is initiated to display the game has been started
    # Params:
    # +playername+:: the playername which was read before with :read_playername
    def display_welcome_message(playername)
      @io.puts "Hello #{playername}, your code is generated!"
      @io.puts "Avaliable Characters:\t#{MastermindRuby::Code::AVAILABLE_CHARACTERS.join("\t")} (Case insensitive)"
    end

    # Method which is called when the guess is evaluated
    # Params:
    # +result+:: the result (e.g. BBW-, ATTENTION: Code object)
    def display_assessment(result)
      @io.puts (result)
    end

    # Method which is called when the guess was not a valid code
    def display_invalid_code(code)
      @io.puts 'Invalid code'
    end

    # Method which is called when the game is ended
    # Params:
    # +try_count+:: how many times guessed until finished
    def display_end_game(try_count)
      @io.puts "Congrats! You made it with #{try_count} tries."
    end
  end
end
