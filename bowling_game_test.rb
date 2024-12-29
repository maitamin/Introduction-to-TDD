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

  def test_スペアを取った場合
    @game.record_shot(3)
    @game.record_shot(7) # 10 + 4 = 14
    @game.record_shot(4)
    record_many_shots(17, 0)
    assert_equal 18, @game.score
  end

  def test_直前の投球との合計が10ピンでもフレーム違いはスペアではない
    @game.record_shot(2)
    @game.record_shot(5)
    @game.record_shot(5) # 前の投球との合計が10でもフレーム違いなのでスペアではない
    @game.record_shot(1)
    record_many_shots(16, 0)

    assert_equal 13, @game.score
  end


  private

  def record_many_shots(count, pins)
    count.times do
      @game.record_shot(pins)
    end
  end
end
