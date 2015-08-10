require_relative '../../mastermind_ruby'


class SolveInterface
  attr_reader :current_try

  def initialize(solver)
    @solver = solver
    @code_length = solver.code_length
    @current_try = -1
  end

  def read_playername
    @solver.name
  end

  def read_code_length
    @code_length
  end

  def read_next_guess(try_count)
    @current_try += 1
    @solver.request_quess(try_count -1)
  end

  def display_welcome_message(playername)
  end

  def display_assessment(result)
    @solver.assessment_received(result)
  end

  def display_invalid_code(code)
    raise ArgumentError, "#{code.inspect} is not a valid code"
    # raise ArgumentError.new('Please enter a valid code')
  end

  def display_end_game(try_count)
  end
end
