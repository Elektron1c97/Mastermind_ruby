require_relative '../test_helper'
require_relative 'stub_interface'

class IntegrationTester < Minitest::Test

  def setup

  end

  def test_with_length_of_4
    input = %w(ABCD YYYY MYRR MMMM RGOY ROGY)
    solution = MastermindRuby::Code.parse('ROGY')
    ui = StubInterface.new('Derp', input)
    game = MastermindRuby::Game.new(ui, solution: solution)
    game.start
    expected_calls = generate_expected_calls('ABCD', 'B---', 'WW--', '----', 'BBWW')
    assert_equal expected_calls, ui.recorded_calls
  end

  def test_with_length_of_5
    input = %w(ABCDE OOOOO PGMMM YYYYY OMYPG OMPGY)
    solution = MastermindRuby::Code.parse('OMPGY')
    ui = StubInterface.new('Derp', input, 5)
    game = MastermindRuby::Game.new(ui, solution: solution)
    game.start
    expected_calls = generate_expected_calls('ABCDE', 'B----', 'WWW--', 'B----', 'BBWWW')
    assert_equal expected_calls, ui.recorded_calls
  end


  def generate_expected_calls(*expected_codes)
    [ [:read_playername],
      [:read_code_length],
      [:display_welcome_message, 'Derp'],
      [:read_next_guess, 1],
      [:display_invalid_code, MastermindRuby::Code.parse(expected_codes[0])],
      [:read_next_guess, 1],
      [:display_assessment, MastermindRuby::Code.parse(expected_codes[1])],
      [:read_next_guess, 2],
      [:display_assessment, MastermindRuby::Code.parse(expected_codes[2])],
      [:read_next_guess, 3],
      [:display_assessment, MastermindRuby::Code.parse(expected_codes[3])],
      [:read_next_guess, 4],
      [:display_assessment, MastermindRuby::Code.parse(expected_codes[4])],
      [:read_next_guess, 5],
      [:display_end_game, 5] ]
  end

end
