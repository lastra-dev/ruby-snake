# frozen_string_literal: true

# A snake.
class Snake
  attr_accessor(:length, :speed, :head_symbol, :tail_symbol, :food_symbol)

  def initialize(length, speed)
    @length = length
    @speed = speed
    @head_symbol = '@'
    @tail_symbol = 'o'
    @food_symbol = '$'
  end
end
