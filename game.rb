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

  def finished?
    @game_finished
  end

  def guess(input)
    # Check if input can be a code, else raise (throw) an Error
    raise ArgumentError.new("Invalid Code") unless input =~ INPUT_PATTERN

    # Get the result from the code (e.g. BW--)
    result = assessment(input)
    # Check if game is ended
    @game_finished = (result == SOLUTION_CODE)
    # If game is not ended, count the tries
    @try_count += 1 unless @game_finished
    result
  end

  def assessment(input)
    tmp = input.split("")
    tmp = mark_right_position(tmp)
    tmp = mark_right_color(tmp)
    tmp = mark_unmatched(tmp)
    tmp.sort.join("").gsub("X", "-")
  end

  # Search for same character at same index, if found delete from input and solution list and add it to the result
  def mark_right_position(input)
    input.each.with_index.map do |char, index|
      if @solution_code[index] == char
        "B"
      else
        char
      end
    end
  end

  def mark_right_color(input)
    rest_solution = @solution_code.map.with_index { |char, index| input[index] == "B" ? nil : char }
    input.each.with_index.map do |char, index|
      if index = rest_solution.index(char)
        rest_solution[index] = nil
        "W"
      else
        char
      end
    end
  end

  def mark_unmatched(input)
    input.map do |char|
      if ["B", "W"].include? char
        char
      else
        "X"
      end
    end
  end

  def generate_code
    4.times.map { AVAILABLE_CODES.sample }
  end
end
