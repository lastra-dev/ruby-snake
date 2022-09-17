# frozen_string_literal: true

require_relative './lib/game'
require_relative './lib/snake'
require_relative './lib/ground'

snake = Snake.new(2, 5)
ground = Ground.new(30, 10)
game = Game.new(ground, snake)
game.start
