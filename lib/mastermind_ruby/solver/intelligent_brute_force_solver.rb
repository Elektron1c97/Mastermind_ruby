require_relative 'solve_interface'

class IntelligentBruteForceSolver
  attr_reader :code_length

  def initialize(code_length: 4)
    @code_length = code_length
    @basic_codes = generate_start_codes
    @basic_try = -1
    @code_try = -1
    @existing_chars = []
  end

  def request_quess(count)
    if @basic_try < 5
      @basic_try += 1
      MastermindRuby::Code.parse(@basic_codes[@basic_try])
    else
      @code_try += 1
      @tryable_codes ||= generate_codes
      MastermindRuby::Code.new(@tryable_codes[@code_try])
    end
  end

  def assessment_received(result)
    unless result == @code_length.times.map { '-' }.join
      result.count('B').times { @existing_chars << MastermindRuby::Code::AVAILABLE_CHARACTERS[@basic_try] }
    end
  end

  def generate_start_codes
    MastermindRuby::Code::AVAILABLE_CHARACTERS.map do |char|
      char * @code_length
    end
  end

  def generate_codes
    @existing_chars.permutation.to_a.uniq
  end
end
