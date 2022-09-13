# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/snake'
require 'test/unit'

# Tests Game Class.
class TestGame < Test::Unit::TestCase
  def setup
    @snake1 = Snake.new(2, 5)
    @test_game1 = Game.new(10, 3, @snake)
    @test_game2 = Game.new(8, 3, @snake)
  end

  def test_make_2d_array_with_dimensions
    # 10 x 3
    assert_equal([['┌', '─', '─', '─', '─', '─', '─', '─', '─', '┐'],
                  ['│', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '│'],
                  ['└', '─', '─', '─', '─', '─', '─', '─', '─', '┘']], @test_game1.ground)

    # 8 x 3
    assert_equal([['┌', '─', '─', '─', '─', '─', '─', '┐'],
                  ['│', ' ', ' ', ' ', ' ', ' ', ' ', '│'],
                  ['└', '─', '─', '─', '─', '─', '─', '┘']], @test_game2.ground)
  end
end
