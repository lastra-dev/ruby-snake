# frozen_string_literal: true

require_relative '../lib/snake'
require 'test/unit'

# Tests Snake Class.
class TestSnake < Test::Unit::TestCase
  def test_make_snake_should_have_correct_length
    snake1 = Snake.new(2, 5)
    assert_equal('oo@', snake1.make)

    snake2 = Snake.new(4, 5)
    assert_equal('oooo@', snake2.make)
  end
end
