class VentureCapitalist
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name 
    @@all << self
  end

  def self.all
    @@all
  end

  def total_worth
    sum = 0
    FundingRound.all.each do |funding| 
      if funding.venture_capitalist == self
        sum += funding.investment
      end
    end
    sum
  end

  def self.tres_commas_club
    VentureCapitalist.all.select {|venture_capitalist| venture_capitalist.total_worth > 1000000000}
  end

  def offer_contract(startup, type, investment)
  #given a startup object, type of investment (as a string), and the amount invested (as a float), 
  #creates a new funding round and associates it with that startup and venture capitalist.
    FundingRound.new(startup, self, type, investment)
  end

  def funding_round
  #returns an array of all funding rounds for that venture capitalist  
    FundingRound.all.select {|funding| funding.venture_capitalist == self}
  end

  def portfolio
  #Returns a unique list of all startups this venture capitalist has funded
    list = FundingRound.all.select {|funding| funding.venture_capitalist == self}
    list.map {|investor| investor.startup}.uniq
  end

  def biggest_investment
  #returns the largest funding round given by this venture capitalist
    list = FundingRound.all.select {|funding| funding.venture_capitalist == self} 
    list.max {|a, b| a.investment <=> b.investment}
  end

  def invested(domain)
  #given a domain string, returns the total amount invested in that domain
    sum = 0
    FundingRound.all.each do |funding|
      if funding.venture_capitalist == self && funding.startup.domain == domain
        sum += funding.investment
      end
    end
    return sum
  end


end
