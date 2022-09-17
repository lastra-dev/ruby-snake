# frozen_string_literal: true

require 'io/console'
require_relative './helpers/game_helpers'

# Responsible of managing UI, score and snake.
class Game
  include GameHelpers
  attr_accessor(:width, :height, :ground, :snake)

  def initialize(width, height, snake)
    @width = width
    @height = height
    @snake = snake
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

  def set_snake_position
    @ground[@snake.head_row][@snake.head_col] = @snake.head_symbol
  end

  def spawn_snake
    @snake.set_random_position_on_ground(@width, @height)
    set_snake_position
  end

  def start
    clear_screen
    spawn_snake
    print_ground
    loop do
      next unless DIRECTIONS.value? arrow_key = input

      @snake.change_direction(arrow_key)
      clear_screen # Needs to be cleared because of broken output.
      @snake.move
      set_snake_position
      print_ground
    end
  end

  private

  def input
    input_text = $stdin.getch
    exit(0) if input_text == "\u0003" # CONTROL + C
    arrow_key = read_arrow_keys(input_text)
    amend_broken_output
    arrow_key
  end

  def read_arrow_keys(input_text)
    return unless input_text == "\e"

    # rubocop:disable Style/RescueModifier
    input_text << $stdin.read_nonblock(3) rescue nil
    input_text << $stdin.read_nonblock(2) rescue nil
    # rubocop:enable Style/RescueModifier
    input_text
  end

  def amend_broken_output
    $stdin.cooked!
  end

  def clear_screen
    if Gem.win_platform?
      system 'cls'
    else
      system 'clear'
    end
  end
end
