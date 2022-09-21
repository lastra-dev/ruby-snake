# frozen_string_literal: true

require 'io/console'
require_relative './helpers/game_helpers'
require_relative './ground'

# Responsible of managing UI, score and snake.
class Game
  include GameHelpers

  def initialize(ground, snake)
    @ground = ground
    @snake = snake
  end

  def set_snake_on_ground
    @ground.area[@snake.head_row][@snake.head_col] = @snake.head_symbol
    @snake.length.times do |t|
      @ground.area[@snake.head_row][@snake.head_col - t - 1] = @snake.tail_symbol
    end
  end

  def spawn_snake
    @snake.set_random_position_on_ground(@ground.width, @ground.height)
    set_snake_on_ground
  end

  def start
    clear_screen
    spawn_snake
    @ground.render
    loop do
      next unless DIRECTIONS.value? arrow_key = input

      @snake.change_direction(arrow_key)
      clear_screen # Needs to be cleared because of broken output.
      @ground.clear_area!
      @snake.move
      set_snake_on_ground
      @ground.render
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
