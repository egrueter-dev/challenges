# # YOUR CODE GOES HERE
# # * The user is playing against a computer opponent in Rock, Paper, Scissors.
# # * A game consists of a series of rounds until either player has won.
# # * The first player to win two rounds is declared the winner and the game ends.
# # * The number of rounds won by the player and the computer are shown each round.
# # * Output the winner of the game before exiting.
# # * The computer opponent randomly chooses between rock, paper, and scissors each round.
# # * The user chooses their shape by typing `"r"` (rock), `"p"` (paper), or `"s"` (scissors) each round.
# # * If the player enters an invalid shape, print an error message and start the next round.
# # * If both players choose the same shape, it is a tie and no one wins the round.
#
#
# puts "Welcome to Rock, Paper, Scissors"
#   computer = 0
#   player = 0
#   round = 1
#
#
# while computer < 2 || player < 2 #best out of 6.. not sure why || operator is not working here.
# #while computer < 2 || player < 2 this waits untill both values reach 2... instead of either one.
#   rock = 1
#   paper = 1
#   scissors = 1
#
#   puts "Computer score: #{computer} player score: #{player}"
#   puts "Pick rock(r), paper(p) or scissors(s)"
#   player_selection = gets.chomp
#
#   if  player_selection != 's' || player_selection != 'r' || player_selection != 'p'
#     puts "You must select from rock(r) paper(p), or s(s)"
#     player_selection = gets.chomp
#   elsif
#     puts "Round.....#{round}"
#     round += 1
#
#     if player_selection == 'p'
#       puts "Player selected paper"
#       player_selection = paper
#       scissors += 1
#       rock -= 1
#     elsif player_selection == 's'
#       puts "Player selected scissors"
#       player_selection = scissors
#       paper -= 1
#       rock += 1
#     elsif player_selection == 'r'
#       puts "Player selected rock"
#       player_selection = rock
#       paper += 1
#       scissors -= 1
#     end
#
#     random_calc = rand(1...100) #corrected ... issue
#
#     if random_calc <= 33
#       computer_selection = rock
#       puts "Computer selected rock"
#     elsif random_calc > 33 && random_calc < 66
#       computer_selection = paper
#       puts "Computer selected paper"
#     elsif random_calc >= 66
#       computer_selection = scissors
#       puts "Computer selected scissors"
#     end
#
#     if player_selection.to_i > computer_selection.to_i
#       player += 1
#     elsif computer_selection.to_i > player_selection.to_i
#       computer +=1
#     else
#       puts "tie"
#     end
#   end
# end
#
# puts computer
# puts player
#
# if computer > player
#   puts "Computer wins with a score of #{computer}"
# else
#   puts "Player wins with a score of #{player}"
# end
#
#

# random_calc = rand(1..100) #check output includes 100...
#
#   if random_calc <= 33 #check output includes 33..
#     computer_selection = rock
#   elsif random_calc > 33 && random_calc < 66
#     computer_selection = paper
#   elsif random_calc >= 66
#     computer_selection = scissors
#   end


class Player
  def initialize(name)
    puts "New player named #{name} created."
  end

  def name
    @name = name
  end

  def score
    @score = score
  end

  def Ropos(value)
    @play = value
    if @play == 'r'
       return @play
    elsif @play == 's'
       return @play
    elsif @play == 'p'
       return @play
    else
      puts "Please enter Rock(r), Paper(p), or Scissors(s), to continue"
    end
  end
end

class Computer
  def initialize

  end

  def comp_score
    @comp_score = rand( )

  end
end





  player = Player.new('erik')
  puts player.Ropos('t')
