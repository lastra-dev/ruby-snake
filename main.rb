# frozen_string_literal: true

require_relative './lib/game'
require_relative './lib/snake'
require_relative './lib/ground'

snake = Snake.new
ground = Ground.new width: 30, height: 10
game = Game.new(ground, snake)
game.start
