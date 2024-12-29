class BowlingGame
  def initialize
    @score = 0
    @spare = false
    @last_pins = 0
    @shot_no = 1
    @strike_bonus_count = 0
  end

  def record_shot(pins)
    @score += pins
    calc_spare_bonus(pins)
    calc_strike_bonus(pins)
    @last_pins = pins
    proceed_next_shot
  end

  def score
    @score
  end

  private

  def calc_spare_bonus(pins)
    if @spare
      @score += pins
      @spare = false
    end
    if @shot_no == 2 && @last_pins + pins == 10
      @spare = true
    end
  end

  def calc_strike_bonus(pins)
    if @strike_bonus_count > 0
      @score += pins
      @strike_bonus_count -= 1
    end
    if pins == 10
      @strike_bonus_count = 2
    end
  end

  def proceed_next_shot
    if @shot_no == 1
      @shot_no = 2
    else
      @shot_no = 1
    end
  end
end
