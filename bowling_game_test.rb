require 'minitest/autorun'
require_relative 'bowling_game'

class BowlingGameTest < Minitest::Unit::TestCase
  def setup
    @game = BowlingGame.new
  end

  def test_全ての投球がガター
    record_many_shots(20, 0)
    assert_equal 0, @game.score
  end

  def test_全ての投球で1ピンを倒した場合
    record_many_shots(20, 1)
    assert_equal 20, @game.score
  end

  private
  
  def record_many_shots(count, pins)
    count.times do
      @game.record_shot(pins)
    end
  end
end
