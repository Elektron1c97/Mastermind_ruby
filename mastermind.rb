require_relative 'console_interface'
require_relative 'game'

ui = ConsoleInterface.new
# Game intialization
game = Game.new(ui)
game.start
