# frozen_string_literal: true

require_relative './lib/game'
require_relative './lib/snake'

snake = Snake.new(2, 5)
game = Game.new(30, 10, snake)
game.start
game.print_ground
