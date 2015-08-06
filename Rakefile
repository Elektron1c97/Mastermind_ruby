task :default => :test

desc 'Run all tests'
task :test => ["test:unit", "test:integration"]

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

task :run do
  trap(0) { system "bin/mastermind" }
end
