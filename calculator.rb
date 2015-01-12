puts "What is your first number?"
num1 = gets.chomp

puts "What is your second number?"
num2 = gets.chomp

begin
  puts "Choose 1) Add, 2) Substract, 3) Multiply or 4) Division."
  operator = gets.chomp
end while operator.to_i > 4 || operator.to_i < 1

if operator == '1'
  result = num1.to_i + num2.to_i
elsif operator == '2'
  result = num1.to_i - num2.to_i
elsif operator == '3'
  result = num1.to_i * num2.to_i
else
  result = num1.to_f / num2.to_f
end

puts result