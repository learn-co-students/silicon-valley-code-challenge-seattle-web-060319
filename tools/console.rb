require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

startup1 = Startup.new("HubGit", "Aliya", "wwww.hubgit.com")
startup2 = Startup.new("OverflowStack", "Rohit", "www.overflowstack.com")

startup1.pivot("www.hb.com", "HB")

fr1 = FundingRound.new(startup1, "Noah", "Pre-Seed", 5000)
fr2 = FundingRound.new(startup2, "Hao", "Series B", 10000)
fr3 = FundingRound.new(startup1, "Hao", "Pre-Seed", 2000)
fr4 = FundingRound.new(startup1, "Noah", "Series B", 30000)

venturecap1 = VentureCapitalist.new("Noah", 1000000000)
venturecap2 = VentureCapitalist.new("Hao", 2000000000)

# startup1.sign_contract("Noah", "Series B", 200000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
