require_relative '../test_helper'

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
  code = MastermindRuby::Code.new(args[0])
  assessment = code.assessment_for_solution(MastermindRuby::Code.new(args[1]))
  puts unless assessment == MastermindRuby::Code.new(res)
  if assessment == MastermindRuby::Code.new(res)
    print '.'
  else
    puts "#{args.inspect} \nExpected:\t#{res.join.inspect}\nGot:\t\t#{assessment.to_s.inspect}"
  end
end
puts ' done'
