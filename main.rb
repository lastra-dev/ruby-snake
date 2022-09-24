# frozen_string_literal: true

require_relative './lib/game'
require_relative './lib/snake'
require_relative './lib/map'

snake = Snake.new
map = Map.new width: 30, height: 10
game = Game.new(map, snake)
game.start
