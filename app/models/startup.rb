require 'pry'

class Startup
  attr_reader :name, :founder, :domain
  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def self.all
    @@all
  end

  def pivot(domain, name)
    @domain = domain
    @name = name
  end

  def self.find_by_founder(founder)
    self.all.find do |founder|
      founder.name
    end
  end

  def self.domains
    self.all.collect do |startup|
      startup.domain
    end
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def num_funding_rounds
    x = FundingRound.all.select do |funding_round|
      funding_round.startup == self
        # funding_round.count
      end
    x.count
  end

  def total_funds
    x = FundingRound.all.select do |funding_round|
      funding_round.startup == self
    end
    y = x.collect do |funding_round|
      funding_round.investment
    end
    y.sum
  end

  def investors
    x = FundingRound.all.select do |funding_round|
      funding_round.startup == self
    end
    y = x.collect do |funding_round|
      funding_round.venture_capitalist
    end
    y.uniq
  end

  def big_investors
    x = VentureCapitalist.tres_commas_club
    x.select do |capitalist|
      self.investors.include? (capitalist)
    end
  end

end
