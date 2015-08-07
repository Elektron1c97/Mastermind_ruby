require_relative '../test_helper'
require_relative 'stub_interface'

input = %w(ABCD YYYY MYRR MMMM RGOY ROGY)
solution = MastermindRuby::Code.parse('ROGY')
ui = StubInterface.new('Derp', input)
game = MastermindRuby::Game.new(ui, solution: solution)
game.start

expected_calls = [[:read_playername],
                  [:read_code_length],
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

input = %w(ABCDE OOOOO PGMMM YYYYY OMYPG OMPGY)
solution = MastermindRuby::Code.parse('OMPGY')
ui = StubInterface.new('Derp', input, 5)
game = MastermindRuby::Game.new(ui, solution: solution)
game.start

expected_calls = [[:read_playername],
                  [:read_code_length],
                  [:display_welcome_message, 'Derp'],
                  [:read_next_guess, 1],
                  [:display_invalid_code],
                  [:read_next_guess, 1],
                  [:display_assessment, MastermindRuby::Code.parse('B----')],
                  [:read_next_guess, 2],
                  [:display_assessment, MastermindRuby::Code.parse('WWW--')],
                  [:read_next_guess, 3],
                  [:display_assessment, MastermindRuby::Code.parse('B----')],
                  [:read_next_guess, 4],
                  [:display_assessment, MastermindRuby::Code.parse('BBWWW')],
                  [:read_next_guess, 5],
                  [:display_end_game, 5]]
assert_array_order_equal expected_calls, ui.recorded_calls
puts ' done'
