class VentureCapitalist
  attr_reader :name, :total_worth
  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.collect do |venture_capitalist|
      venture_capitalist.total_worth >= 1000000000
      # binding.pry
        venture_capitalist.name
    end
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, invesment)
  end

  def funding_rounds
    x = FundingRound.all.select do |funding_round|
      funding_round.venture_capitalist == self.name
    end
    x.count
  end

  def portfolio
    x = FundingRound.all.select do |funding_round|
      funding_round.startup
    end
    y = x.collect do |funding_round|
      funding_round.startup.name
    end
    y.uniq
  end

  def biggest_investment
    biggest = 0
    x = FundingRound.all.select do |funding_round|
      funding_round.venture_capitalist == self.name
    end
    y = x.collect do |funding_round|
      if funding_round.investment > biggest
        biggest = funding_round.investment
      end
    end
    biggest
  end

  def invested(domain)
    total = 0
    x = FundingRound.all.select do |funding_round|
      funding_round.venture_capitalist == self.name
    end
    x.collect do |funding_round|
      if funding_round.startup.domain == domain
        total += funding_round.investment
      end
    end
    total
  end

end
