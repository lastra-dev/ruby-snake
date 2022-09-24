# frozen_string_literal: true

# Game map
class Map
  include GameHelpers
  attr_accessor(:area)
  attr_reader(:width, :height)

  def initialize(width:, height:)
    @width = width
    @height = height
    make_map
  end

  def make_map
    make_map_array
    set_map_top_border
    set_map_bottom_border
    set_map_vertical_borders
    set_map_corners
  end

  def make_map_array
    @area = Array.new(@height) { Array.new(@width) { ' ' } }
  end

  def set_map_top_border
    @area[0].each_index do |i|
      area[0][i] = '─'
    end
  end

  def set_map_bottom_border
    area[@height - 1].each_index do |i|
      area[@height - 1][i] = '─'
    end
  end

  def set_map_vertical_borders
    area.each do |row|
      row[0] = '│'
      row[@width - 1] = '│'
    end
  end

  def set_map_corners
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
    make_map
  end
end
