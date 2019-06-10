class Startup

  @@all = []

  attr_accessor :name, :domain
  attr_reader :founder

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
    @name = name
    @domain = domain
  end

  def self.find_by_founder(founder_name)
    self.all.find { |startup| startup.founder == founder_name }
  end

  def self.domains
    domain_arr = self.all.map { |startup| startup.domain }
    return domain_arr.uniq
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def all_rounds
    FundingRound.all.select do |round|
      round.startup == self
    end
  end

  def num_funding_rounds
    all_rounds.length
  end

  def total_funds
    total = 0
    all_rounds.each do |round|
      total += round.investment
    end
    return total
  end

  def investors
    array = all_rounds.map do |round|
      round.venture_capitalist
    end
    return array.uniq
  end

  def big_investors
    investors.select do |investor|
      VentureCapitalist.tres_commas_club.include?(investor)
    end
  end

end
