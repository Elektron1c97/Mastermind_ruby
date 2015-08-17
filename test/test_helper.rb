require_relative '../lib/mastermind_ruby/game'
require_relative '../lib/mastermind_ruby/code'
require 'minitest/autorun'

def assert_array_order_equal(expected, actual)
  if actual == expected
    print '......'
  else
    last_matching_index = 0
    last_matching_index_reverse = 0
    actual.each.with_index do |value, index|
      last_matching_index = index
      break if expected[index] != value
    end

    reversed_expected_order = expected.dup.reverse
    actual.reverse_each.with_index do |value, index|
      last_matching_index_reverse = -index
      break if reversed_expected_order[index] != value
    end
    last_matching_index_reverse -= 1

    puts 'Method calls out of order'
    puts "Expected: #{format_method_order expected[last_matching_index..last_matching_index_reverse]}"
    puts "Got:      #{format_method_order actual[last_matching_index..last_matching_index_reverse]}"
  end
end

def format_method_order(methods)
  methods.map { |m| m.to_s.ljust(30) }.join
end
