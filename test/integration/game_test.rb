require_relative '../test_helper'

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
    MastermindRuby::Code.parse(@input_codes[@current_try])
  end

  def method_missing(name, *args)
    @recorded_calls << [name, *args]
  end
end

solution = MastermindRuby::Code.parse('ROGY')
ui = TestInterface.new('Derp', %w(ABCD YYYY MYRR MMMM RGOY ROGY))
game = MastermindRuby::Game.new(ui, solution: solution)
game.start

expected_calls = [[:read_playername],
                  [:display_welcome_message, 'Derp'],
                  [:read_next_guess, 1],
                  [:display_invalid_code],
                  [:read_next_guess, 1],
                  [:display_assessment, MastermindRuby::Code.parse('B---')],
                  [:read_next_guess, 2],
                  [:display_assessment, MastermindRuby::Code.parse('WW--')],
                  [:read_next_guess, 3],
                  [:display_assessment, MastermindRuby::Code.parse('----')],
                  [:read_next_guess, 4],
                  [:display_assessment, MastermindRuby::Code.parse('BBWW')],
                  [:read_next_guess, 5],
                  [:display_end_game, 5]]
assert_array_order_equal expected_calls, ui.recorded_calls
puts ' done'
