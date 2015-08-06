module MastermindRuby
  class Code
    AVAILABLE_CHARACTERS = %w(R Y G O M P)
    CODE_PATTERN = /\A[#{AVAILABLE_CHARACTERS.join("")}]{4}\z/

    def initialize(code)
      @code = code
    end

    # Parse a string to a code object
    # Params:
    # +str+:: the string which is to parse to a code object
    def self.parse(str)
      new str.split('')
    end

    # Method to generate a code
    def self.random
      new 4.times.map { AVAILABLE_CHARACTERS.sample }
    end

    # Returns a code object containing 'BBBB'
    def self.solution
      @solution ||= Code.parse('BBBB')
    end

    # Checks if a code is valid (must be 4 characters long and can only contain the available characters)
    def valid?
      @code.join =~ CODE_PATTERN
    end

    # Returns true if code is 'BBBB'
    def solution?
      self == Code.solution
    end

    # Get assesment for solution
    # e.g. self is YYRG and solution is MMGR it will return WW-- (Code Object)
    # Params:
    # +solution+:: the solution which an assessment should be made with
    def assessment_for_solution(solution)
      tmp = @code.dup
      tmp = mark_right_position(tmp, solution)
      tmp = mark_right_color(tmp, solution)
      tmp = mark_unmatched(tmp)
      Code.parse(tmp.sort.join('').tr('X', '-'))
    end

    # Search for same character at same index and mark it with 'B'
    # Params:
    # +input+:: the input
    # +solution+:: the solution to compare with
    def mark_right_position(input, solution)
      input.each.with_index.map do |char, index|
        if solution[index] == char
          'B'
        else
          char
        end
      end
    end

    # Search for character contained in solution
    # Params:
    # +input+:: the input
    # +solution+:: the solution to compare with
    def mark_right_color(input, solution)
      rest_solution = solution.map.with_index { |char, index| input[index] == 'B' ? nil : char }
      input.each.with_index.map do |char, index|
        if index = rest_solution.index(char)
          rest_solution[index] = nil
          'W'
        else
          char
        end
      end
    end

    # Mark unmatched with an '-'
    # Params:
    # +input+:: the input which should be filled with '-'
    def mark_unmatched(input)
      input.map do |char|
        if %w(B W).include? char
          char
        else
          'X'
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

    def to_s
      @code.join
    end
  end
end
