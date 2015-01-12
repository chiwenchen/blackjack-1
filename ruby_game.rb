require 'pry'
CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}

def display_winner(winning_choice)
  case winning_choice
  when 'p'
    print "Paper wraps Rock!"
  when 'r'
    print "Rock smashes Scissors!"
  when 's'
    print "Scissors cuts Paper!"
  end
end

loop do 

  # Player makes a pick
  begin
    puts "Choose one: (P/R/S)"
    person_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(person_choice)

  # Computer makes a pick
  computer_choice = CHOICES.keys.sample

  # Display choices
  puts "You picked #{CHOICES.fetch(person_choice)} and computer picked #{CHOICES.fetch(computer_choice)}."

  # Conditions
  if person_choice == computer_choice
    puts "It's a tie!"
  elsif (person_choice == 'p' && computer_choice == 'r') || (person_choice == 'r' && computer_choice == 's') || (person_choice == 's' && computer_choice == 'p')
    puts display_winner(person_choice)
    puts "You won!"
  else
    puts display_winner(computer_choice)
    puts "Computer won!"
  end

  # Check if user wants to play again.
  puts "Play again? (Y/N)"
  break if gets.chomp.downcase != 'y'

end

puts "Good bye!"