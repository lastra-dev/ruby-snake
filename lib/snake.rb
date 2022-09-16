# frozen_string_literal: true

require_relative './helpers/game_helpers'

# A snake.
class Snake
  include GameHelpers
  attr_accessor(:length,
                :speed,
                :head_symbol,
                :tail_symbol,
                :food_symbol,
                :direction)

  def initialize(length, speed)
    @length = length
    @speed = speed
    @head_symbol = '@'
    @tail_symbol = 'o'
    @food_symbol = '$'
    @direction = DIRECTIONS[:right]
  end

  def change_direction(input)
    @direction = input
  end
end
