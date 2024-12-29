class BowlingGame
  def initialize
    @score = 0
    @spare = false
    @last_pins = 0
    @shot_no = 1
  end

  def record_shot(pins)
    @score += pins
    if @spare
      @score += pins
      @spare = false
    end
    if @shot_no == 2 && @last_pins + pins == 10
      @spare = true
    end
    @last_pins = pins
    if @shot_no == 1
      @shot_no = 2
    else
      @shot_no = 1
    end
  end

  def score
    @score
  end
end
