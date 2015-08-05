require_relative 'game'
require_relative 'code'
require_relative 'test_helper'

{
  [%w(Y R O G), %w(X Y C M)] => %w(W - - -),
  [%w(Y R O G), %w(Y R C M)] => %w(B B - -),
  [%w(Y R O G), %w(O R Y M)] => %w(B W W -),
  [%w(Y R O G), %w(O Y R M)] => %w(W W W -),
  [%w(Y R O G), %w(M M M M)] => %w(- - - -),
  [%w(Y Y R M), %w(O P Y Y)] => %w(W W - -),
  [%w(Y Y Y M), %w(O O O Y)] => %w(W - - -),
  [%w(O O O Y), %w(Y Y Y M)] => %w(W - - -),
  [%w(Y P Y Y), %w(Y Y O O)] => %w(B W - -),
  [%w(Y Y P P), %w(O Y Y O)] => %w(B W - -),
  [%w(Y Y P P), %w(O Y O O)] => %w(B - - -),
  [%w(R O Y Y), %w(R O G R)] => %w(B B - -)
}.each do |args, res|
  code = Code.new(args[0])
  assessment = code.assessment_for_solution(Code.new(args[1]))
  puts unless assessment == Code.new(res)
end

class TestInterface
  attr_reader :recorded_calls

  def initialize(playername, input)
    @current_try = -1
    @recorded_calls = []
    @input_codes = input
    @playername = playername
  end

  def read_playername
    super
    @playername
  end

  def read_next_guess(try_count)
    super
    @current_try += 1
    Code.parse(@input_codes[@current_try])
  end

  def method_missing(name, *args)
    @recorded_calls << [name, *args]
  end
end

solution = Code.parse('ROGY')
ui = TestInterface.new('Derp', %w(ABCD YYYY MYRR MMMM RGOY ROGY))
game = Game.new(ui, solution: solution)
game.start

expected_calls = [[:read_playername],
                  [:display_welcome_message, 'Derp'],
                  [:read_next_guess, 1],
                  [:display_invalid_code],
                  [:read_next_guess, 1],
                  [:display_assessment, Code.parse('B---')],
                  [:read_next_guess, 2],
                  [:display_assessment, Code.parse('WW--')],
                  [:read_next_guess, 3],
                  [:display_assessment, Code.parse('----')],
                  [:read_next_guess, 4],
                  [:display_assessment, Code.parse('BBWW')],
                  [:read_next_guess, 5],
                  [:display_end_game, 5]]
assert_array_order_equal expected_calls, ui.recorded_calls
