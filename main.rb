# frozen_string_literal: true

require_relative './lib/game'

game = Game.new
game.set_dimensions(100, 50)
puts game.make_box
