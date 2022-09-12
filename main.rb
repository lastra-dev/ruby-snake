# frozen_string_literal: true

require_relative './lib/game'

game = Game.new
game.set_dimensions(10, 3)
game.make_ground
game.print_ground
