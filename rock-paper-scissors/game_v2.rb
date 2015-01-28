player = { "player" => 0, "comput" => 0 }
defeats = { :r => :p, :p => :s, :s => :r }

until (player["player"] >= 2 || player["comput"] >= 2)  #not sure why i need (
  puts "Please select Rock(r), Paper(p) or Scissors(s)"
  computer_s = defeats.keys.sample
  player_s = gets.chomp.to_sym

  if computer_s == defeats[player_s]
    player["comput"] += 1
  elsif player_s == defeats[computer_s]
    player['player'] += 1
  elsif computer_s == player_s
    puts "tie, choose again..."
  else
    puts "Choose either 'p', 's', or 'r'"
  end
  puts "Rounds won: \n Computer: #{player["comput"]} \n Player: #{player["player"]}"
end

if player['player'] > player['comput']
  puts "Player Wins!"
else
  puts "Computer Wins!"
end
