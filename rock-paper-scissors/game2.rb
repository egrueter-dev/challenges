
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Rock, Paper, Scissors - V 0.0.2 <<<<<<<<<<<<<<<<
#
#
# # This new game includes:
#
# # 1. A smarter way to get to a random selection for computer.
# # 2. A smaller, cleaner program that is stylistically correct.


player = 0
computer = 0
round = 1
array = ['r','p','s']
length = array.length

p ">>>>>>>>>>>>>>>>> Rock, Paper Scissors V - 0.0.2 <<<<<<<<<<<<<"

until (player >= 2 || computer >= 2)

p "____________________________Round #{round}!__________________________"
p "Player Score: #{player}"
p "Computer Score #{computer}"

p "......Player, please select either Rock(r), Paper(p) or Scissors!(s)"

computer_selection = array[rand(0..length -1)]
player_selection = gets.chomp

  if (player_selection == 'p' && computer_selection == 's')
    p "Computer Wins with Scissors"
    computer += 1
  elsif (player_selection == 'p' && computer_selection == 'r')
    p "Player Wins with Paper"
    player += 1
  elsif (player_selection == 's' && computer_selection == 'p')
    p "Player Wins with Scissors"
    player += 1
  elsif (player_selection == 's' && computer_selection == 'r')
    p "Computer Wins with Rock"
    computer += 1
  elsif (player_selection == 'r' && computer_selection == 's')
    p "Player Wins with Rock"
    player += 1
  elsif (player_selection == 's' && computer_selection == 'p')
    p "Computer Wins with Paper"
    computer += 1
  elsif (player_selection == computer_selection)
    p "Tie!"
    p "You both chose: #{computer_selection}"
  else
       p "Please choose from either Paper (p) Rock (r) or Scissor (s)"
       p "Round restarting....."
  end
round += 1
end

puts "Final Scores:"
puts "Player #{player}"
puts "Computer #{computer}"
