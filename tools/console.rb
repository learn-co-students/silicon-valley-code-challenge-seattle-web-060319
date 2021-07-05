require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
qtip = StartUp.new("qtip", "john stamos", "www.qtip.com")
qtip = StartUp.new("qtip", "john", "www.qtip.com")
tape = StartUp.new("tape", "jacob tape", "www.tape.com")

john = VentureCapitalist.new("John", 1000000000)
april = VentureCapitalist.new("April", 2384928181)
greg = VentureCapitalist.new("Greg", 202023)

fund1 = FundingRound.new(qtip, john, "angel", 200)
fund3 = FundingRound.new(qtip, greg, "angel", 400)
fund2 = FundingRound.new(tape, april, "Series A", 10000)
fund4 = FundingRound.new(tape, greg, "Seed", 1000)

qtip.num_funding_rounds
qtip.total_funds
qtip.investors

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
