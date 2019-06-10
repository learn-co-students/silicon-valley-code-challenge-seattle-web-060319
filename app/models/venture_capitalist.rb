class VentureCapitalist

  @@all = []

  attr_accessor :cash
  attr_reader :name

  def initialize(name, cash)
    @name = name
    @cash = cash
    @@all << self
  end

  def self.all
    @@all
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
    @cash -= investment
  end

  def funding_rounds
    FundingRound.all.select do |round|
      round.venture_capitalist == self
    end
  end

  def total_worth
    investments = 0
    funding_rounds.each do |round|
      investments += round.investment
    end
    return investments + @cash
  end

  def self.tres_commas_club
    tcc = @@all.select do |vc|
      vc.total_worth > 1000000000
    end
    tcc.map do |member|
      puts "#{member.name}: $#{member.total_worth}"
    end
  end

  def portfolio
    startups = funding_rounds.map { |round| round.startup }
    return startups.uniq
  end

  def biggest_investment
    investments = funding_rounds.map { |round| round.investment }
    sorted = investments.sort { |a,b| b <=> a }
    return sorted[0]
  end

  def invested(dom)
    total = 0
    funding_rounds.each do |round|
      if round.startup.domain == dom
        total += round.investment
      end
    end
    return total
  end

end
