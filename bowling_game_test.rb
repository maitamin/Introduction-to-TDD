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

  def test_ストライクを取ると次の2投分の点数が加算される
    @game.record_shot(10) # 10 + 3 + 3 = 16
    @game.record_shot(3)
    @game.record_shot(3)
    @game.record_shot(1)
    record_many_shots(15, 0) # 全体では19投になる

    assert_equal 23, @game.score
  end

  def test_連続ストライクすなわちダブル
    @game.record_shot(10) # 10 + 10 + 3 = 23
    @game.record_shot(10) # 10 + 3 + 1 = 14
    @game.record_shot(3)
    @game.record_shot(1)
    record_many_shots(14, 0) # 全体では18投になる

    assert_equal 41, @game.score
  end

  def test_3連続ストライクすなわちターキー
    @game.record_shot(10) # + 10 + 3 = 30
    @game.record_shot(10) # + 10 + 3 = 23
    @game.record_shot(10) # + 3 + 1 = 14
    @game.record_shot(3)
    @game.record_shot(1)
    record_many_shots(12, 0) # 全体では17投になる

    assert_equal 71, @game.score
  end

  private

  def record_many_shots(count, pins)
    count.times do
      @game.record_shot(pins)
    end
  end
end
