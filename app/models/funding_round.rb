class FundingRound

  attr_reader :startup, :venturecapitalist, :type, :investment

  @@all = []

  def initialize(startup, venturecapitalist, type, investment)
    @startup = startup
    @venturecapitalist = venturecapitalist
    @type = type
    @investment = investment
    @@all << self
  end

  def self.all
    @@all
  end

end


# Angel, Pre-Seed, Seed, Series A, Series B, Series C, etc.
