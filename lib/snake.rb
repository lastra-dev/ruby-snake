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
                :direction,
                :head_row,
                :head_col)

  def initialize(length, speed)
    @length = length
    @speed = speed
    @head_symbol = '@'
    @tail_symbol = 'o'
    @food_symbol = '$'
    @direction = DIRECTIONS[:right]
  end

  def change_direction(arrow_key)
    raise "Invalid arrow key: #{arrow_key}" unless DIRECTIONS.value? arrow_key

    @direction = arrow_key
  end

  def set_random_position_on_ground(ground_width, ground_height)
    first_free_space = 1
    last_free_space_row = ground_height - 2
    last_free_space_col = ground_width - 2
    random_row = Random.rand(first_free_space..last_free_space_row)
    random_col = Random.rand(first_free_space..last_free_space_col)
    @head_row = random_row
    @head_col = random_col
  end

  # rubocop:disable Metrics/MethodLength
  def move
    case @direction
    when DIRECTIONS[:up]
      @head_row -= 1
    when DIRECTIONS[:down]
      @head_row += 1
    when DIRECTIONS[:left]
      @head_col -= 1
    when DIRECTIONS[:right]
      @head_col += 1
    else
      raise "Snake moving in unkown direction #{@direction}"
    end
  end
  # rubocop:enable Metrics/MethodLength

  private

  def change_position(row, col)
    @head_row = row
    @head_col = col
  end
end
