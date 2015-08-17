require "bundler/gem_tasks"
require 'rake/testtask'

task :default => :test

desc 'Run all solvers'
task :solve => ["solve:intelligent_brute_force", "solve:brute_force"]

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

task :statistics do
  trap(0) { system "bin/statistics" }
end

task :run do
  trap(0) { system "exe/mastermind" }
end

task :console do
  trap(0) { system "irb -r'mastermind_ruby'" }
end

Rake::TestTask.new do |t|
  t.libs << "unit_test"
  t.test_files = FileList['test/unit/*_test.rb']
  t.verbose = true
end

Rake::TestTask.new do |t|
  t.libs << "integration_test"
  t.test_files = FileList['test/integration/*_test.rb']
  t.verbose = true
end
