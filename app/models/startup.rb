class Startup
  attr_accessor :name, :domain
  attr_reader :founder

  @@all = []

  def initialize(name, domain, founder)
    @name = name
    @domain = domain
    @founder = founder
    @@all << self
  end

  def pivot(domain, name)
    @domain = domain
    @name = name
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def funding_rounds
    FundingRound.all.select { |funding_round| funding_round.startup == self }
  end

  def num_funding_rounds
    self.funding_rounds.count
  end

  def total_funds
    total = 0
    self.funding_rounds.collect { |funding_round| total += funding_round.investment }
    return total
  end

  def investors
    self.funding_rounds.collect { |funding_round| funding_round.venture_capitalist }
  end

  def big_investors
    self.investors & VentureCapitalist.tres_commas_club
  end

  def self.all
    @@all
  end

  def self.find_by_founder(specific_founder)
    @@all.select { |startup| startup.founder == specific_founder}
  end

  def self.domains
    @@all.collect { |startup| startup.domain }
  end
end