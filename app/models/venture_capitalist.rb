class VentureCapitalist
  attr_accessor :name, :total_worth

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  @@all = []

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select { |funding_round| funding_round.venture_capitalist == self }
  end

  def portfolio
    startups = self.funding_rounds.collect { |funding_round| funding_round.startup }
    return startups.uniq
  end

  def biggest_investment
    investments = self.funding_rounds.collect { |funding_round| funding_round.investment }
    investments.sort
    biggest_investment = investments[-1]
    self.funding_rounds.select { |funding_round| funding_round.investment == biggest_investment }
  end

  def invested(specific_domain)
    total = 0
    invested_startups = self.funding_rounds.select { |funding_round| funding_round.startup.domain == specific_domain }
    invested_startups.collect { |invested_startup| total += invested_startup.investment }
    return total
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    @@all.select { |vc| vc.total_worth >= 1000000000 }
  end
end