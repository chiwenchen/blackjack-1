# 1. Store name of the player
# 2. 2 cards for player and dealer respectively
# 3. Player first; Hit or Stand
# 4. If Hit then add another card. ==> Check value
# 5. If Stay then Dealer gets new card, Hit until minimum 17. OR Stay.
# If Dealer busts (>21), Player win. If Dealer gets 21, Dealer wins.
# If Dealer Stay ==> compare the sum of all cards; higher value wins.
require 'pry'

def card_deck
  card_deck = {"spades_2" => 2, "spades_3" => 3, "spades_4" => 4, "spades_5" => 5,
              "spades_6" => 6, "spades_7" => 7, "spades_8" => 8, "spades_9" => 9,
              "spades_10" => 10, "spades_jack" => 10, "spades_king" => 10, "spades_queen" => 10,
              "spades_Ace" => 11, "hearts_2" => 2, "hearts_3" => 3, "hearts_4" => 4, "hearts_5" => 5,
              "hearts_6" => 6, "hearts_7" => 7, "hearts_8" => 8, "hearts_9" => 9,
              "hearts_10" => 10, "hearts_jack" => 10, "hearts_king" => 10, "hearts_queen" => 10,
              "hearts_Ace" => 11, "diamonds_2" => 2, "diamonds_3" => 3, "diamonds_4" => 4, "diamonds_5" => 5,
              "diamonds_6" => 6, "diamonds_7" => 7, "diamonds_8" => 8, "diamonds_9" => 9,
              "diamonds_10" => 10, "diamonds_jack" => 10, "diamonds_king" => 10, "diamonds_queen" => 10,
              "diamonds_Ace" => 11, "clubs_2" => 2, "clubs_3" => 3, "clubs_4" => 4, "clubs_5" => 5,
              "clubs_6" => 6, "clubs_7" => 7, "clubs_8" => 8, "clubs_9" => 9,
              "clubs_10" => 10, "clubs_jack" => 10, "clubs_king" => 10, "clubs_queen" => 10,
              "clubs_Ace" => 11}
end

def store_name(name)
  puts "What is your name?"
  name = gets.chomp
end

def winning_condition  
  true
end

name = store_name(name)
cards = card_deck.keys
player_cards = []
dealer_cards = []

begin
  if player_cards.empty? == true
    player_cards = cards.sample(2)
  else
    player_cards << cards.sample
  end
  player_total = 0
  card_deck.each{|key, value| player_total += value if player_cards.include?(key) == true}
  puts "\e[H\e[2J" 
  puts "#{name}'s cards: (total: #{player_total})"
  puts player_cards
  puts "+++++++++"

  if dealer_cards.empty? == true
    dealer_cards << cards.sample
    dealer_total = 0
    card_deck.each{|key, value| dealer_total += value if dealer_cards.include?(key) == true}
    puts "Dealer's card: (total: #{dealer_total}}"
    puts dealer_cards
    puts "*Undisclosed card*"
  else
    dealer_cards << cards.sample
    dealer_total = 0
    card_deck.each{|key, value| dealer_total += value if dealer_cards.include?(key) == true}
    puts "Dealer's card: (total: #{dealer_total}}"
    puts dealer_cards
  end

  # if dealer_total <= 21 && player_total <= 21
  #   puts "Do you want to (H)it or (S)tay?"
  #   player_choice = gets.chomp.downcase
  #   if player_choice == 'h'
  #     next
  #   elsif player_choice == 's'

  #   else
  #   end
  # end

  hit = gets.chomp.downcase
  if hit == 'h'
    break
  end
end while winning_condition == true

