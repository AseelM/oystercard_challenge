class Oystercard

  attr_reader :balance
  LIMIT_VALUE = 90
  LIMIT_ERROR = "your balance will exceed #{LIMIT_VALUE}"

  def initialize (balance = 0)
    @balance = balance
  end

  def top_up(credit)
    raise LIMIT_ERROR  if (@balance + credit) > LIMIT_VALUE
    @balance += credit
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    @card_state = :in_journey
  end

  def in_journey?
    @card_state == :in_journey
  end

  def touch_out
    @card_state = nil
  end

end
