module MastermindRuby
  class Game
    attr_reader :try_count

    def initialize(ui, solution: nil)
      @solution_code = solution
      @ui = ui
      @try_count = 1
      @started = false
    end

    # Method to start a game
    # Requests by calling :read_playername on the UI for the playername
    # Requests by calling :read_code_length on the UI for the code_length
    # Requests by calling :display_welcome_message on the UI for displaying the welcome message
    def start
      @started = true
      @playername = @ui.read_playername
      @code_length = @ui.read_code_length
      @solution_code ||= Code.random(@code_length)
      @ui.display_welcome_message(@playername)
      run
    end

    # Method to restart the game
    # Resets the solution code to a new one (auto generated)
    # Resets the try count to 1
    def restart
      @started = true
      @solution_code = Code.random(@code_length)
      @try_count = 1
      run
    end

    private

    # Checks if the guess has a valid length
    def guess_valid_length?(guess)
      guess === /\A.{#{@code_length}}\z/
    end

    # Returns if the result passed is the solution
    def result_solution?(result)
      result == Code.solution(@code_length)
    end

    # Method to run the game (prevent from dying if the solution was not found yet)
    # Requests by calling :read_next_guess for a new guess on the UI
    # Shows an assessment on the UI by calling :display_assessment
    def run
      while running?
        guess = @ui.read_next_guess(@try_count)
        if guess_valid_length?(guess) && guess.valid?
          result = guess.assessment_for_solution(@solution_code)
          if result_solution?(result)
            stop
          else
            @try_count += 1
            @ui.display_assessment(result)
          end
        else
          @ui.display_invalid_code(guess)
        end
      end
    end

    # Method to stop the game
    # On the ui display_end_game is called
    def stop
      @started = false
      @ui.display_end_game(@try_count)
    end

    # Method to check if the game is running
    def running?
      @started
    end
  end
end
