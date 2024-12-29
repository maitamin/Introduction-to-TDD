require 'minitest/autorun'
require_relative 'bowling_game'

class BowlingGameTest < Minitest::Unit::TestCase
  def test_all_gutter_game
    game = BowlingGame.new
    20.times do
        game.record_shot(0)
    end
    assert_equal 0, game.score
  end
end
