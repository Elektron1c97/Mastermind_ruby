require_relative 'solve_interface'

class BruteForceSolver
  attr_reader :name, :code_length

  def initialize(name = "Brute Force Solver", code_length: 4)
    @name = name
    @code_length = code_length
    @input = generate_start_codes
  end

  def request_quess(count)
    MastermindRuby::Code.parse(@input[count])
  end

  def generate_start_codes
    MastermindRuby::Code::AVAILABLE_CHARACTERS.repeated_permutation(@code_length).map &:join
  end

  def assessment_received(result)
    # idiot solver ignores what assessment is received
  end
end
