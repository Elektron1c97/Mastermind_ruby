require_relative 'code'
require_relative 'GameNotStartedError'

class Game
  attr_reader :try_count

  def initialize(playername = "Derp", solution: Code.random)
    @try_count = 1
    @playername = playername
    @solution_code = solution
    @started = false
  end

  def finished?
    @game_finished
  end

  def guess(input_code)
    if @started
      result = input_code.assessment_for_solution(@solution_code)
      # Check if game is ended
      self.end if result.solution?
      # If game is not ended, count the tries
      @try_count += 1

      result
    else
      raise GameNotStartedError.new("Game is not started!")
    end
  end

  def start
    @started = true
    @on_start.call
  end

  def end
    @on_end.call
    @started = false
  end

  def on_start(&block)
    @on_start = block
  end

  def on_end(&block)
    @on_end = block
  end

end
