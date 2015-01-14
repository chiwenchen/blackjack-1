require 'pry'

$board = {1 => " ", 2 => " ", 3 => " ", 4 => " ",5 => " ", 6 => " ",7 => " ", 8 => " ", 9 => " "}
empty_boxes = [1, 2, 3, 4, 5, 6, 7, 8 ,9]

def display_boxes
  puts "\e[H\e[2J"  

  puts "--------TIC TAC TOE-----------"
  puts "The most challenging game ever"
  puts "~~~~~~~~~Good luck!~~~~~~~~~~~"
  puts 
  puts
  puts 
  puts "     |     |      "
  puts "  #{$board[1]}  |  #{$board[2]}  |  #{$board[3]}   "
  puts "     |     |      "
  puts "-----+-----+------"
  puts "     |     |      "
  puts "  #{$board[4]}  |  #{$board[5]}  |  #{$board[6]}   "
  puts "     |     |      "
  puts "-----+-----+------"
  puts "     |     |      "
  puts "  #{$board[7]}  |  #{$board[8]}  |  #{$board[9]}   "
  puts "     |     |      "
  puts
end


loop do

  display_boxes
  puts "Your input, please: "
  person_turn = gets.chomp.to_i

  while $board[person_turn] == "X" || $board[person_turn] == "O" do
    puts "Box has been filled. Try another box!"
    person_turn = gets.chomp.to_i
  end

  $board[person_turn] = "X"
  empty_boxes.keep_if{|a| a != person_turn}

  win1 = $board.select{|k,v| k == 1 || k == 2 || k == 3}
  win2 = $board.select{|k,v| k == 4 || k == 5 || k == 6}
  win3 = $board.select{|k,v| k == 7 || k == 8 || k == 9}
  win4 = $board.select{|k,v| k == 1 || k == 4 || k == 7}
  win5 = $board.select{|k,v| k == 2 || k == 5 || k == 8}
  win6 = $board.select{|k,v| k == 3 || k == 6 || k == 9}
  win7 = $board.select{|k,v| k == 1 || k == 5 || k == 9}
  win8 = $board.select{|k,v| k == 3 || k == 5 || k == 7}

  # Check if person has won

  if win1.values.count("X") == 3 || win2.values.count("X") == 3 || win3.values.count("X") == 3 || win4.values.count("X") == 3 ||win5.values.count("X") == 3 ||win6.values.count("X") == 3 ||win7.values.count("X") == 3 ||win8.values.count("X") == 3 
    display_boxes
    puts "You WIN!"
    break
  elsif empty_boxes.count == 0
    display_boxes
    puts "It's a tie!"
    break
  end

  # Check if there is two in a row

  if win1.values.count("O") == 2 && win1.values.count("X") == 0
    computer_turn = win1.select{|k,v| v == " "}.keys.first
  elsif win2.values.count("O") == 2 && win2.values.count("X") == 0
    computer_turn = win2.select{|k,v| v == ' '}.keys.first
  elsif win3.values.count("O") == 2 && win3.values.count("X") == 0
    computer_turn = win3.select{|k,v| v == ' '}.keys.first
  elsif win4.values.count("O") == 2 && win4.values.count("X") == 0
    computer_turn = win4.select{|k,v| v == ' '}.keys.first
  elsif win5.values.count("O") == 2 && win5.values.count("X") == 0
    computer_turn = win5.select{|k,v| v == ' '}.keys.first
  elsif win6.values.count("O") == 2 && win6.values.count("X") == 0
    computer_turn = win6.select{|k,v| v == ' '}.keys.first
  elsif win7.values.count("O") == 2 && win7.values.count("X") == 0
    computer_turn = win7.select{|k,v| v == ' '}.keys.first
  elsif win8.values.count("O") == 2 && win8.values.count("X") == 0
    computer_turn = win8.select{|k,v| v == ' '}.keys.first
  elsif win1.values.count("X") == 2 && win1.values.count("O") == 0
    computer_turn = win1.select{|k,v| v == " "}.keys.first
  elsif win2.values.count("X") == 2 && win2.values.count("O") == 0
    computer_turn = win2.select{|k,v| v == ' '}.keys.first
  elsif win3.values.count("X") == 2 && win3.values.count("O") == 0
    computer_turn = win3.select{|k,v| v == ' '}.keys.first
  elsif win4.values.count("X") == 2 && win4.values.count("O") == 0
    computer_turn = win4.select{|k,v| v == ' '}.keys.first
  elsif win5.values.count("X") == 2 && win5.values.count("O") == 0
    computer_turn = win5.select{|k,v| v == ' '}.keys.first
  elsif win6.values.count("X") == 2 && win6.values.count("O") == 0
    computer_turn = win6.select{|k,v| v == ' '}.keys.first
  elsif win7.values.count("X") == 2 && win7.values.count("O") == 0
    computer_turn = win7.select{|k,v| v == ' '}.keys.first
  elsif win8.values.count("X") == 2 && win8.values.count("O") == 0
    computer_turn = win8.select{|k,v| v == ' '}.keys.first
  else
    computer_turn = empty_boxes.sample.to_i
  end

  $board[computer_turn] = "O"
  empty_boxes.keep_if{|a| a != computer_turn}

  win1 = $board.select{|k,v| k == 1 || k == 2 || k == 3}
  win2 = $board.select{|k,v| k == 4 || k == 5 || k == 6}
  win3 = $board.select{|k,v| k == 7 || k == 8 || k == 9}
  win4 = $board.select{|k,v| k == 1 || k == 4 || k == 7}
  win5 = $board.select{|k,v| k == 2 || k == 5 || k == 8}
  win6 = $board.select{|k,v| k == 3 || k == 6 || k == 9}
  win7 = $board.select{|k,v| k == 1 || k == 5 || k == 9}
  win8 = $board.select{|k,v| k == 3 || k == 5 || k == 7}

  # Check if computer has won
  
  if win1.values.count("O") == 3 || win2.values.count("O") == 3 || win3.values.count("O") == 3 || win4.values.count("O") == 3 ||win5.values.count("O") == 3 ||win6.values.count("O") == 3 ||win7.values.count("O") == 3 ||win8.values.count("O") == 3 
    display_boxes
    puts "Yeah. You LOSE!!!"
    break 
  end

end
puts "================== o0o ==================" 
puts