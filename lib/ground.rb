# frozen_string_literal: true

# Game ground
class Ground
  include GameHelpers
  attr_accessor(:area)
  attr_reader(:width, :height)

  def initialize(dimensions)
    @width = dimensions[:width]
    @height = dimensions[:height]
    make_ground
  end

  def make_ground
    make_ground_array
    set_ground_top_border
    set_ground_bottom_border
    set_ground_vertical_borders
    set_ground_corners
  end

  def make_ground_array
    @area = Array.new(@height) { Array.new(@width) { ' ' } }
  end

  def set_ground_top_border
    @area[0].each_index do |i|
      area[0][i] = '─'
    end
  end

  def set_ground_bottom_border
    area[@height - 1].each_index do |i|
      area[@height - 1][i] = '─'
    end
  end

  def set_ground_vertical_borders
    area.each do |row|
      row[0] = '│'
      row[@width - 1] = '│'
    end
  end

  def set_ground_corners
    area[0][0] = '┌'
    area[0][@width - 1] = '┐'
    area[@height - 1][0] = '└'
    area[@height - 1][@width - 1] = '┘'
  end

  def render
    area.each do |row|
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

  def clear_area!
    make_ground
  end
end
