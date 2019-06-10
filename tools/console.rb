require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

su1 = Startup.new("DinnerMovie", "dinnermovie.com", "Dex Fitch")
su2 = Startup.new("Yuunoh", "yuunoh.com", "Jeanne Churchwell")
vc1 = VentureCapitalist.new("Billy Bigpockets", 1200000)
vc2 = VentureCapitalist.new("Donna Deeppockets", 2000000000)
vc3 = VentureCapitalist.new("Stella Superpockets", 999999999999999)
fr1 = FundingRound.new(su1, vc1, "Seed", 2000)
fr2 = FundingRound.new(su2, vc2, "Seed", 1000)
fr3 = FundingRound.new(su1, vc3, "Angel", 100000)
fr4 = FundingRound.new(su1, vc1, "Angel", 888888)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line