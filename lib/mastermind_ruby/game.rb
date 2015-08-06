module MastermindRuby
  class Game
    attr_reader :try_count

    def initialize(ui, solution: Code.random)
      @solution_code = solution
      @ui = ui
      @try_count = 1
      @started = false
    end

    # Method to start a game
    # Requests by calling read_playername for the playername on the UI
    def start
      @started = true
      @playername = @ui.read_playername
      @ui.display_welcome_message(@playername)
      run
    end

    private

    # Method to run the game (prevent from dying if the solution was not found yet)
    # Requests by calling read_next_guess for a new guess on the UI
    # Shows an assessment on the UI by calling display_assessment
    def run
      while running?
        guess = @ui.read_next_guess(@try_count)
        if guess.valid?
          result = guess.assessment_for_solution(@solution_code)
          if result.solution?
            stop
          else
            @try_count += 1
            @ui.display_assessment(result)
          end
        else
          @ui.display_invalid_code
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
