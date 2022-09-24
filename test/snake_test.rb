# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/snake'
require_relative '../lib/helpers/game_helpers'

class TestSnake < MiniTest::Unit::TestCase
  include GameHelpers

  def setup
    @snake = Snake.new
  end

  def test_invalid_direction_should_raise
    assert_raises do
      @snake.direction = 'invalid direction'
    end
  end

  def test_direction_shouldnt_raise_with_directions_values
    DIRECTIONS.each_value { |direction| @snake.direction = direction }
  end

  def test_valid_direction_should_be_set
    @snake.direction = DIRECTIONS[:up]
    assert_equal @snake.direction, DIRECTIONS[:up]
  end
end
