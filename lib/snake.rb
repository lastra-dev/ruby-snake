# frozen_string_literal: true

# A snake.
class Snake
  def initialize(length, speed)
    @length = length
    @speed = speed
  end

  def make
    "#{'o' * @length}@"
  end
end
