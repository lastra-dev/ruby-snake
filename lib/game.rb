# frozen_string_literal: true

# Responsible of managing UI, score and snake.
class Game
  attr_accessor(:width, :height, :ground)

  def set_dimensions(width, height)
    @width = width
    @height = height
  end

  def make_ground
    create_ground
    set_ground_top_border
    set_ground_bottom_border
    set_ground_vertical_borders
    set_ground_corners
  end

  def create_ground
    @ground = Array.new(@height) { Array.new(@width) { ' ' } }
  end

  def set_ground_top_border
    @ground[0].each_index do |i|
      @ground[0][i] = '─'
    end
  end

  def set_ground_bottom_border
    @ground[@height - 1].each_index do |i|
      @ground[@height - 1][i] = '─'
    end
  end

  def set_ground_vertical_borders
    @ground.each do |row|
      row[0] = '│'
      row[@width - 1] = '│'
    end
  end

  def set_ground_corners
    @ground[0][0] = '┌'
    @ground[0][@width - 1] = '┐'
    @ground[@height - 1][0] = '└'
    @ground[@height - 1][@width - 1] = '┘'
  end

  def print_ground
    @ground.each do |row|
      print_tiles(row)
      puts "\n"
    end
  end

  def print_tiles(row)
    row.each do |tile|
      print tile
      $stdout.flush
    end
  end
end
