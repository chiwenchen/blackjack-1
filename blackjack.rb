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

def used_card
  used_card = {"spades_2" => ' ', "spades_3" => ' ', "spades_4" => ' ', "spades_5" => ' ',
              "spades_6" => ' ', "spades_7" => ' ', "spades_8" => ' ', "spades_9" => ' ',
              "spades_10" => ' ', "spades_jack" => ' ', "spades_king" => ' ', "spades_queen" => ' ',
              "spades_Ace" => ' ', "hearts_2" => ' ', "hearts_3" => ' ', "hearts_4" => ' ', "hearts_5" => ' ',
              "hearts_6" => ' ', "hearts_7" => ' ', "hearts_8" => ' ', "hearts_9" => ' ',
              "hearts_10" => ' ', "hearts_jack" => ' ', "hearts_king" => ' ', "hearts_queen" => ' ',
              "hearts_Ace" => ' ', "diamonds_2" => ' ', "diamonds_3" => ' ', "diamonds_4" => ' ', "diamonds_5" => ' ',
              "diamonds_6" => ' ', "diamonds_7" => ' ', "diamonds_8" => ' ', "diamonds_9" => ' ',
              "diamonds_10" => ' ', "diamonds_jack" => ' ', "diamonds_king" => ' ', "diamonds_queen" => ' ',
              "diamonds_Ace" => ' ', "clubs_2" => ' ', "clubs_3" => ' ', "clubs_4" => ' ', "clubs_5" => ' ',
              "clubs_6" => ' ', "clubs_7" => ' ', "clubs_8" => ' ', "clubs_9" => ' ',
              "clubs_10" => ' ', "clubs_jack" => ' ', "clubs_king" => ' ', "clubs_queen" => ' ',
              "clubs_Ace" => ' '}
end

def store_name(name)
  puts "What is your name?"
  name = gets.chomp
end

cards = used_card.keys


def player_cards(cards)
  if used_card.has_value?('X') == false
    first_cards = cards.sample(2)
    first_cards.each{|x| used_card[x] = 'X'}
  else
    puts "OK"
  end
end

def winning_condition  
  true
end

begin
  puts player_cards(cards)
  hit = gets.chomp.downcase
  if hit == 'h'
    break
  end
end while winning_condition == true

