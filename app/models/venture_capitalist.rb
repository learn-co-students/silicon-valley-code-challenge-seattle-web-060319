class VentureCapitalist

  attr_accessor :name, :worth


  @@all = []

  def initialize(name, worth)
    @name = name
    @worth = worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    # binding.pry
    @@all.select do |club|
      club.name if club.worth > 999999999
    end
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select do |fund|
    # binding.pry
    fund.venturecapitalist == self
    end
  end

  def portfolio
    FundingRound.all.select do |fund|
      if fund.venturecapitalist == self
      fund.startup
      end
    # Returns a unique list of all startups this venture capitalist has funded
    end
  end

  def biggest_investment
    array = FundingRound.all.select do |fund|
      fund.venturecapitalist == self
    end
    array.max {|a,b| a.investment <=> b.investment }
  end

  def invested(domain)
    FundingRound.all.select do |fund|
      if fund.startup.domain == domain
        return fund.startup.total_funds
      end
    end
  end



end
