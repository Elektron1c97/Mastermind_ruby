require_relative 'game'

puts "This is an automated test"

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
[%w(R O Y Y), %w(R O G R)] => %w(B B - -),
}.each do |args, res|
  game = Game.new('Automated Testing', solution: args[1])
  unless (output = game.guess(args.first.join(""))) == res.join("")
    puts "#{args.inspect} \nExpected:\t#{res.join.inspect}\nGot:\t\t#{output.inspect}"
  else
    print "."
  end
end
puts " done"
