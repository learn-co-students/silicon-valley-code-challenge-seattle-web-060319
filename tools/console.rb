require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

stockexchange = Startup.new("StockExChange", "Spencer", "Finance")
chickenstand = Startup.new("Gas Chicken", "Rohit", "Food and Beverage")
flatironschool = Startup.new("Flatiron School", "Avi", "Education")
billpay = Startup.new("Bill's Pay", "Bill", "Finance")

elonmusk = VentureCapitalist.new("Elon Musk", 1000000000.0)
jeffbezos = VentureCapitalist.new("Jeff Bezos", 70000000000.0)
yourdad = VentureCapitalist.new("Your Dad", 100.0)
billgates = VentureCapitalist.new("Bill Gates", 1000000000.0)


elonmusk.offer_contract(stockexchange, "IPO", 100000.0)
jeffbezos.offer_contract(stockexchange, "Counter", 150000.0)
elonmusk.offer_contract(chickenstand, "Shark Tank Offer", 1000000.0)
elonmusk.offer_contract(billpay, "Screw Buffett Offer", 500000.0)

pry
0 #leave this here to ensure binding.pry isn't the last line