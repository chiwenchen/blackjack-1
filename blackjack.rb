require 'pry'
player_money = 100
player_bet = 0
player_cards = []
dealer_cards = []
player_choice = ''

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

def get_player_bet(player_name, player_money)
  puts "#{player_name}, you have #{player_money} now. Please put your bet:"
end

def check_winner(player_total, dealer_total, player_choice, dealer_cards, player_bet)
  if player_total > 21
    return "Player loses"
  elsif dealer_total > 21
    return "Player wins"
  elsif player_total == 21
    return "Blackjack"
  elsif player_total > dealer_total && dealer_cards.count >= 2 && dealer_total > 16 && dealer_total < 22
    return "Player wins"
  elsif player_total < dealer_total && dealer_cards.count >= 2 && dealer_total > 16 && dealer_total < 22
    return "Player loses"
  elsif player_total < 21 || dealer_total < 21
    false
  end
end

system 'clear'
puts "Welcome to the Blackjack Game"
puts "============================="
puts
puts "Please write your name:"
player_name = gets.chomp
player_total = 0
dealer_total = 0

begin
  begin
    system 'clear'
    get_player_bet(player_name, player_money)
    player_bet = gets.chomp.to_i
  end while  player_bet > player_money
    player_money = player_money - player_bet

card_deck
  
  begin  
    puts "\e[H\e[2J" 
    puts "================================"
    puts "YOUR CARDS:"
    if player_cards.empty? == true
      player_cards = card_deck.keys.sample(2)
    elsif player_choice == 's'
      player_cards
    else
      player_cards << card_deck.keys.sample
    end
    puts player_cards
    puts
    sleep(1)
    puts "DEALER CARDS:"
    if dealer_cards.empty? == true
      dealer_cards << card_deck.keys.sample
      puts dealer_cards
      puts "*Undisclosed card*"
    elsif player_choice == 'h'
      puts dealer_cards
      puts "*Undisclosed card*"
    elsif player_choice == 's'
      dealer_cards << card_deck.keys.sample
      puts dealer_cards
    end

    puts "================================"
    sleep(1.5)
    player_total = 0
    card_deck.each{|key, value| player_total += value if player_cards.include?(key) == true}
    puts "You: #{player_total}"

    dealer_total = 0
    card_deck.each{|key, value| dealer_total += value if dealer_cards.include?(key) == true}
    puts "Dealer: #{dealer_total}"

    if player_choice == '' || player_choice == 'h'
      if check_winner(player_total, dealer_total, player_choice, dealer_cards, player_bet) != false
        break
      else
        puts "Your bet is #{player_bet}. Do you want to (H)it or (S)tay?"
        player_choice = gets.chomp.downcase 
      end
    elsif player_choice == 's'
      if dealer_total < 17
        next
      end
    end


  end while check_winner(player_total, dealer_total, player_choice, dealer_cards, player_bet) == false

  if player_total == dealer_total
    puts "PUSH!"
    player_money = player_bet + player_money
  elsif check_winner(player_total, dealer_total, player_choice, dealer_cards, player_bet) == "Player loses"
    puts "YOU LOSE!"
    player_money
  elsif check_winner(player_total, dealer_total, player_choice, dealer_cards, player_bet) == "Blackjack"
    puts "BLACKJACK!"
    player_money = (player_bet * 3) + player_money
  else
    puts "YOU WIN"
    player_money = (player_bet * 2) + player_money
  end
  if player_money == 0
    puts "You are broke! Try again next time."
    break
  end
  puts "Play again (Y/N)?"
  restart = gets.chomp.downcase
  system 'clear'
  player_bet = 0
  player_cards = []
  dealer_cards = []
  player_choice = ''

end while restart == 'y'