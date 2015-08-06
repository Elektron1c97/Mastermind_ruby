require_relative '../lib/mastermind_ruby/console_interface'
require_relative '../lib/mastermind_ruby/game'

ui = ConsoleInterface.new
# Game intialization
game = MastermindRuby::Game.new(ui)
game.start
