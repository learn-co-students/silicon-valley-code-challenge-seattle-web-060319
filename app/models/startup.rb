require 'pry'

class StartUp

attr_reader :founder, :domain
attr_accessor :name

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
  # def domain
  #
  # end

  def pivot(domain, name)
    @domain = domain
    @name = name
  end

  def self.find_by_founder(founder)
    self.all.find do |startup|
      startup.founder == founder
    end
  end

  def self.domains
    self.all.map do |startup|
      startup.domain
    end
  end

  def sign_contract(venturecapitalist, type, investment)
    FundingRound.new(self, venturecapitalist, type, investment)
  end

  def num_funding_rounds
    number_rounds = FundingRound.all.select do |fund|
      fund.startup == self
    end
    number_rounds.count
  end

  def total_funds
    balance = 0
    FundingRound.all.each do |fund|
      if fund.startup == self
        balance += fund.investment.to_f
      end
    end
    balance
  end

  def investors
    investor_array = FundingRound.all.map do |fund|
      if fund.startup == self
       fund.venturecapitalist
      end
    end
    investor_array.uniq
  end

  def big_investors
    investors & VentureCapitalist.tres_commas_club
  end
    # if self.investors == VentureCapitalist.tres_commas_club
    #   return self.investors

    # Returns a unique array of all the venture capitalists that have invested in this company and are in the Trés Commas club

end



# Startup.all
# should return all of the startup instances
# Startup.find_by_founder
# given a string of a founder's name, returns the first startup whose founder's name matches
# Startup.domains
# should return an array of all of the different startup domains
