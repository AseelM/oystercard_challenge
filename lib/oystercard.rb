class Oystercard

  attr_reader :balance
  LIMIT_HIGH = 90
  LIMIT_LOW = 1
  LIMIT_ERROR = "your balance will exceed #{LIMIT_HIGH}"
  BALANCE_ERROR = "insuficient funds for journey"

  def initialize (balance = 0)
    @balance = balance
  end

  def top_up(credit)
    raise LIMIT_ERROR  if (@balance + credit) > LIMIT_HIGH
    @balance += credit
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    fail BALANCE_ERROR if @balance < LIMIT_LOW
    @card_state = :in_journey
  end

  def in_journey?
    @card_state == :in_journey
  end

  def touch_out
    @card_state = nil
  end

end
