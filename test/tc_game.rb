# frozen_string_literal: true

require_relative '../lib/game'
require 'test/unit'

# Tests Game Class.
class TestGame < Test::Unit::TestCase
  def setup
    @test_game1 = Game.new
    @test_game1.set_dimensions(10, 3)

    @test_game2 = Game.new
    @test_game2.set_dimensions(8, 3)
  end

  def test_set_dimensions_set_width_and_height
    game = Game.new
    game.set_dimensions(10, 5)
    assert_equal(10, game.width)
    assert_equal(5, game.height)
  end

  def test_make_box_with_given_dimensions
    assert_equal("
      ┌────────┐
      │        │
      └────────┘
    ", @test_game1.make_box)

    assert_equal("
      ┌──────┐
      │      │
      └──────┘
    ", @test_game2.make_box)
  end
end
