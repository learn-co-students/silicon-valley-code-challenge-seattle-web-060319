class Startup
  attr_accessor :name, :domain
  attr_reader :founder
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
    @name = name
    @domain = domain
  end

  def self.find_by_founder(founder_name)
    Startup.all.find {|startup| startup.founder == founder_name}
  end

  def self.domains
    Startup.all.map {|startup| startup.domain}
  end

  def sign_contract(venture, type, amount)
  #given a venture capitalist object, type of investment (as a string), 
  #and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
    FundingRound.new(self, venture, type, amount)
  end

  def num_funding_rounds
    FundingRound.all.select {|funding| funding.startup == self}.length 
  end

  def total_funds
  #Returns the total sum of investments that the startup has gotten
    sum = 0
    FundingRound.all.each do |funding|
      if funding.startup == self
        sum += funding.investment
      end
    end
    return sum
  end

  def investors
  #Returns a unique array of all the venture capitalists that have invested in this company
    list = FundingRound.all.select {|funding| funding.startup == self}
    list.map {|investor| investor.venture_capitalist}.uniq
  end

  def big_investors
  #Returns a unique array of all the venture capitalists that have invested in this company and are in the Trés Commas club

    self.investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}
  end
end

