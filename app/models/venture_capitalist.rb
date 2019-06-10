class VentureCapitalist

    attr_reader :name, :total_worth

    @@all = []
    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth

        @@all << self
    end




    #returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 total_worth)
    def self.tres_commas_club
        array = @@all.select do |capitalist|
            capitalist.total_worth >= 1000000000.0
        end
        array.uniq
    end


    #given a startup object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end


    #returns an array of all funding rounds for that venture capitalist
    def funding_rounds
        FundingRound.all.select do |round|
            round.venture_capitalist == self
        end
    end


    #Returns a unique list of all startups this venture capitalist has funded
    def portfolio
        array = funding_rounds.map do |rounds|
            rounds.startup
        end
        array.uniq
    end


    #returns the largest funding round given by this venture capitalist
    def biggest_investment
        array = FundingRound.all.select do |round|
            if round.venture_capitalist == self
                round
            end
        end
        sorted = array.sort_by do |x|
            x.investment
        end
        sorted[-1]
    end


    #given a domain string, returns the total amount invested in that domain
    def invested(domain)
        array = FundingRound.all.select do |round|
            round.venture_capitalist == self && round.startup.domain == domain
        end
        invest = array.map {|x| x.investment}
        invest.inject(0, :+)
    end


    def self.all
        @@all
    end

end



