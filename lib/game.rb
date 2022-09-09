# frozen_string_literal: true

BOX_LEFT_MARGIN = ' ' * 6

# Responsible of managing UI, score and snake.
class Game
  attr_accessor(:width, :height)

  def set_dimensions(width, height)
    @width = width
    @height = height
  end

  # Returns a box with @width and @height.
  #
  # "
  #   ┌──────┐
  #   │      │
  #   └──────┘
  # "
  #
  # @return [String]
  def make_box
    "
      ┌#{'─' * (@width - 2)}┐
      #{make_vertical_borders(@width, @height)}
      └#{'─' * (@width - 2)}┘
    "
  end

  # Returns vertical borders, example:
  # width 10 and height 2
  #
  # "│        │
  #    │        │"
  #
  # @return [String]
  def make_vertical_borders(width, height)
    result = ''
    height_without_edges = height - 2
    horizontal_space = ' ' * (width - 2)
    last_iteration = height - 3

    height_without_edges.times do |i|
      result += i.zero? ? "│#{horizontal_space}│" : "#{BOX_LEFT_MARGIN}│#{horizontal_space}│"
      result += "\n" unless i == last_iteration
    end
    result
  end
end
