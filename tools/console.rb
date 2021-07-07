require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
facebook = Startup.new("facebook", "Mark", "facebook.com")
apple = Startup.new("Apple", "Jobs", "apple.com")
tesla = Startup.new("Tesla", "Musk", "tesla.com")
A = VentureCapitalist.new("a")
B = VentureCapitalist.new("b")
C = VentureCapitalist.new("c")
FundingRound.new(facebook, A, "angel", 1000.00)
FundingRound.new(facebook, C, "angel", 200.00)
FundingRound.new(facebook, B, "angel", 1100000000.00)
FundingRound.new(apple, A, "angel", 200.00) 
FundingRound.new(tesla, C, "angel", 1100.00)
FundingRound.new(apple, C, "angel", 12000000.00)
apple.sign_contract(B, "angel", 2000.00)
apple.sign_contract(C, "angel", 5000.00)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line