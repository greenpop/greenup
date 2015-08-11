class Price

  attr_reader :amount
  def initialize(amount)
    @amount = amount
  end

  def to_s

    "R" + amount.round.to_s
  end
end