def guess_number guess
  number = 25
  if number == guess
    puts "You got it!"
  elsif number > guess
    puts "You guessed too low!"
  else
    puts "You guessed to high!"
  end
end

guess_number 22 
