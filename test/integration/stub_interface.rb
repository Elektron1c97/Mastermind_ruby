class StubInterface
  attr_reader :recorded_calls

  def initialize(playername, input, code_length = 4)
    @current_try = -1
    @recorded_calls = []
    @input_codes = input
    @playername = playername
    @code_length = code_length
  end

  def read_playername
    super
    @playername
  end

  def read_code_length
    super
    @code_length
  end

  def read_next_guess(try_count)
    super
    @current_try += 1
    MastermindRuby::Code.parse(@input_codes[@current_try])
  end

  def method_missing(name, *args)
    @recorded_calls << [name, *args]
  end
end
