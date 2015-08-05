class Code
  AVAILABLE_CHARACTERS = ["R", "Y", "G", "O", "M", "P"]
  CODE_PATTERN = /\A[#{AVAILABLE_CHARACTERS.join("")}]{4}\z/

  def initialize(code)
    @code = code
  end

  def self.parse(str)
    new str.split('')
  end

  def self.random
    new 4.times.map { AVAILABLE_CHARACTERS.sample }
  end

  def valid?
    @code.join =~ CODE_PATTERN
  end

  def solution?
    @code == "BBBB".freeze
  end

  def to_s
    @code.join
  end

  def assessment_for_solution(solution)
    tmp = @code.dup
    tmp = mark_right_position(tmp, solution)
    tmp = mark_right_color(tmp, solution)
    tmp = mark_unmatched(tmp)
    Code.parse(tmp.sort.join("").gsub("X", "-"))
  end

  # Search for same character at same index, if found delete from input and solution list and add it to the result
  def mark_right_position(input, solution)
    input.each.with_index.map do |char, index|
      if solution[index] == char
        "B"
      else
        char
      end
    end
  end

  def mark_right_color(input, solution)
    rest_solution = solution.map.with_index { |char, index| input[index] == "B" ? nil : char }
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

  def [](index)
    @code[index]
  end

  def map(&block)
    @code.map(&block)
  end

  def ==(other)
    to_s == other.to_s
  end

  def eql?(other)
    to_s.eql?(other.to_s)
  end

  def hash
    to_s.hash
  end
end
