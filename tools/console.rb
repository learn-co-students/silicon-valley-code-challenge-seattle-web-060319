require_relative '../config/environment.rb'
require_relative '../app/models/funding_round.rb'
require_relative '../app/models/startup.rb'
require_relative '../app/models/venture_capitalist.rb'

def reload
  load 'config/environment.rb'
end

wally_buffet = VentureCapitalist.new("Wally Buffet", 4500000000.00)
jim_crazier = VentureCapitalist.new("Jim Crazier", 800000000.00)
mark_haitian = VentureCapitalist.new("Mark Haitian", 2000000000.00)
donald_plump = VentureCapitalist.new("Donald Plump", 500000.00)


grapefruit = Startup.new("Grapefruit Computers", "Steve Vocations", "technology" )
congo = Startup.new("Congo", "Jeff Bezos' soon-to-be-ex-wife", "ecommerce")
macrohard = Startup.new("MacroHard", "Golden Gates", "technology")
facespace = Startup.new("FaceSpace", "Mark Suckernerd", "social media")
kindling = Startup.new("Kindling", "Some Lonely Outdoor Enthusiast", "social media")

wb_round1 = wally_buffet.offer_contract(congo, "Seed", 50000000.00)
jc_round1 = jim_crazier.offer_contract(facespace, "Series B", 2000000.00)
mh_round1 = mark_haitian.offer_contract(macrohard, "Series A", 1500000.00)
dp_round1 = donald_plump.offer_contract(facespace, "Series B", 20.00)

wb_round2 = wally_buffet.offer_contract(grapefruit, "Series A", 20000000.00)
jc_round2 = jim_crazier.offer_contract(grapefruit, "Series A", 10000000.00)
mh_round2 = mark_haitian.offer_contract(congo, "Series C", 1500000.00)
dp_round2 = donald_plump.offer_contract(kindling, "Pre-Seed", 5000000000.00)

gc_round3 = grapefruit.sign_contract(mark_haitian, "Seed", 20000000.00)
congo_round3 = congo.sign_contract(donald_plump, "Series A", 50000.00)
macro_round3 = macrohard.sign_contract(wally_buffet, "Series B", 1000000000.00)
fs_round3 = facespace.sign_contract(mark_haitian, "Pre-Seed", 50000000.00)
k_round3 = kindling.sign_contract(jim_crazier, "Series C", 40000000.00)

mh_round4 = mark_haitian.offer_contract(macrohard, "Series C", 5000000)




wally_buffet.total_worth
wally_buffet.funding_rounds
mark_haitian.portfolio
jim_crazier.biggest_investment
donald_plump.total_worth
wally_buffet.invested("technology")

VentureCapitalist.tres_commas_club


#Types: Angel, Pre-Seed, Seed, Series A, Series B, Series C

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
