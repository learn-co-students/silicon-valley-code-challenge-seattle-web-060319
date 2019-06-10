class Startup

    attr_reader :founder
    attr_accessor :name, :domain


    @@all = []
    def initialize(name, founder, domain)
        @founder = founder
        @name = name
        @domain = domain
        @@all << self
    end



    #given a string of a domain and a string of a name, change the domain and name of the startup
    def pivot(domain, name)
        @domain = domain
        @name = name
    end



    #given a string of a founder's name, returns the first startup whose founder's name matches
    def self.find_by_founder(string)
        @@all.find do |startup|
            startup.founder == string
        end
    end


    #should return an array of all of the different startup domains
    def self.domains
        array = @@all.map do |startup|
            startup.domain
        end
        array.uniq
    end


    #creates a new funding round and associates it with that startup and venture capitalist.
    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end


    #Returns the total number of funding rounds that the startup has gotten
    def num_funding_rounds
        array = FundingRound.all.select do |round|
            round.startup == self
        end
        array.length
    end



    #Returns the total sum of investments that the startup has gotten
    def total_funds
        array = FundingRound.all.map do |round|
            if round.startup == self
                round.investment
            end
        end
        array.inject(0, :+)
    end

    
    #Returns a unique array of all the venture capitalists that have invested in this company
    def investors
        array = FundingRound.all.map do |round|
            if round.startup == self
                round.venture_capitalist
            end
        end
        array.uniq
    end


    #Returns a unique array of all the venture capitalists that have invested in this company and are in the Trés Commas club
    def big_investors
        investors & VentureCapitalist.tres_commas_club
    end


    def self.all
        @@all
    end
end
