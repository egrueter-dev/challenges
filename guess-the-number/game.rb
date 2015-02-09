# # # YOUR CODE GOES HERE:
# #
# # # Create a game that picks a random number between
# # # 1 and some max value (e.g. 1000). The user should
# # # then be prompted to guess the number. If the user
# # # guesses correctly, they win the game and the program ends.
# # # If the guess is incorrect, respond with either "Too high" or
# # # "Too low" and prompt for input again.
# #

 class GuessingGame
  def initialize(guess)
    $user_choice = guess
    $comp_selection = rand(1...1000)
  end

  def numeric?(user_choice)
    true if Float(user_choice) rescue false
  end

  def game_logic
    puts $comp_selection
    if $user_selection > $comp_selection
      puts "go Lower"
      $user_selection = gets.chomp.to_i
    elsif $user_selection < $comp_selection
      puts "go Higher"
      $user_selection = gets.chomp.to_i
    else
      puts "done"
      return false
    end
  end

   def run_game
     while numeric?($user_selection) == false
       puts "not a number, select again"
       $user_selection = gets.chomp.to_i
       while true
         puts game_logic
       end
     end
   end
 end

 game1 = GuessingGame.new("p")
 game1.run_game


# $comp_selection = 100
# $user_selection = "p"
#
# while $user_selection != $comp_selection
#   puts "comp selection #{$comp_selection}"
#   puts "user selection #{$user_selection}"
#
#   if numeric?($user_selection) == true
#     puts "please choose again"
#     if $user_selection > $comp_selection
#       puts "You're high - shoot lower, bro"
#     elsif $user_selection < $comp_selection
#       puts "You're low, shoot higher, bro"
#     end
#   else
#     puts "choose another number"
#   end
#
#
#
#   $user_selection = gets.chomp.to_i
# end
