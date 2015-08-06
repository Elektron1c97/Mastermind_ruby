class Game
  AVAILABLE_CODES = ["R", "Y", "G", "O", "M", "P"]
  INPUT_PATTERN = /\A[#{AVAILABLE_CODES.join("")}]{4}\z/
  SOLUTION_CODE = "BBBB"
  attr_reader :game_finished, :try_count

  def initialize(playername = "Derp", solution: generate_code)
    @try_count = 1
    @playername = playername
    @solution_code = solution
  end

  def guess(input)
    # Check if input can be a code, else raise (throw) an Error
    if input =~ INPUT_PATTERN
      # Get the result from the code (e.g. BW--)
      result = result_from_code(input)
      # Check if game is ended
      @game_finished = (result == SOLUTION_CODE)
      # If game is not ended, count the tries
      unless @game_finished
        @try_count += 1
      end
    else
      raise ArgumentError.new("Invalid Code")
    end
    result
  end

  def result_from_code(input)
    # Create empty array for the result
    result = []

    # Split input to an array
    input_code = input.split("")

    # Duplicate input and solution
    unmatched_input = input_code.dup
    unmatched_solution = @solution_code.dup

    # Search for same character at same index, if found delete from input and solution list and add it to the result
    input_code.each.with_index do |char, index|
      if @solution_code[index] == char
        unmatched_solution[index] = nil
        unmatched_input[index] = nil
        result << "B"
      end
    end
    # Search for containing character at any index, if found delete from solution list and add it to the result
    unmatched_input.each.with_index do |char, index|
      if char != nil && index = unmatched_solution.index(char)
        unmatched_solution[index] = nil
        result << "W"
      end
    end
    # Fill code with '-'
    fill_code(result.sort.join(""))
  end

  def fill_code(code)
    code.ljust(4, "-")
  end

  def generate_code
    4.times.map { AVAILABLE_CODES.sample }
  end
end
