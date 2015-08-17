require_relative '../test_helper'

class CodeTester < Minitest::Test

  def setup

  end

  def test_everything_hit
    solution = %w(Y Y O G)
    input = %w(Y Y O G)
    expected = %w(B B B B)
    assert_for_solution_input_expected(solution, input, expected)
  end

  def test_nothing_hit
    solution = %w(R R P P)
    input = %w(Y Y O G)
    expected = %w(- - - -)
    assert_for_solution_input_expected(solution, input, expected)
  end

  def test_everything_contained
    solution = %w(G O Y Y)
    input = %w(Y Y O G)
    expected = %w(W W W W)
    assert_for_solution_input_expected(solution, input, expected)
  end

  def test_some_more_spefic
    {
      [%w(Y P Y Y), %w(Y Y O O)] => %w(B W - -),
      [%w(Y Y P P), %w(O Y Y O)] => %w(B W - -),
      [%w(Y Y P P), %w(O Y O O)] => %w(B - - -),
      [%w(R O Y Y), %w(R O G R)] => %w(B B - -),
    }.each do |args, res|
      assert_for_solution_input_expected(args[1], args[0], res)
    end
  end

  def assert_for_solution_input_expected(solution, input, expected)
    code = MastermindRuby::Code.new(input)
    assessment = code.assessment_for_solution(MastermindRuby::Code.new(solution))
    assert_equal assessment, MastermindRuby::Code.new(expected)
  end

end
