require "bundler/gem_tasks"

task :default => :test

desc 'Run all solvers'
task :solve => ["solve:intelligent_brute_force", "solve:brute_force"]

desc 'Run all tests'
task :test => ["test:unit", "test:integration"]

namespace :solve do
  desc 'Brute force solve'
  task :brute_force do
    puts "----------- Running brute force solve ------------"
    require_relative 'lib/mastermind_ruby/solver/brute_force_solver.rb'
  end

  desc 'Intelligent brute force solve'
  task :intelligent_brute_force do
    puts "----------- Intelligent brute force solve ------------"
    require_relative 'lib/mastermind_ruby/solver/intelligent_brute_force_solver.rb'
  end
end

namespace :test do
  desc 'Run all unit tests'
  task :unit do
    puts "----------- Running unit tests ------------"
    file_list = FileList.new('test/unit/*_test.rb')
    file_list.each { |file| require_relative file }
  end

  desc 'Run all integration tests'
  task :integration do
    puts "----------- Running integration tests ------------"
    file_list = FileList.new('test/integration/*_test.rb')
    file_list.each { |file| require_relative file }
  end
end

task :statistics do
  trap(0) { system "bin/statistics" }
end

task :run do
  trap(0) { system "exe/mastermind" }
end

task :console do
  trap(0) { system "irb -r'mastermind_ruby'" }
end
