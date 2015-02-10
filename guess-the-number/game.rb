# # YOUR CODE GOES HERE:
#
# # Create a game that picks a random number between
# # 1 and some max value (e.g. 1000). The user should
# # then be prompted to guess the number. If the user
# # guesses correctly, they win the game and the program ends.
# # If the guess is incorrect, respond with either "Too high" or
# # "Too low" and prompt for input again.


#Begin Guessing Game:

class GuessingGame
  def initialize
    @comp_selection = rand(1...1000)
  end

  def comp_selection
    @comp_selection
  end

  def numeric?(user_choice)
    true if Float(user_choice) rescue false
  end

  def correct
    puts "You guessed it"
    exit
  end

  def run_game
    puts "Please provide an input"
    user_input = gets.chomp
    while true
      puts "Comp Selection #{comp_selection} (check)"
      if numeric?(user_input) == false
        puts "Invalid Select Again"
        user_input = gets.chomp
      elsif user_input.to_i > comp_selection
        puts "Too High -> Guess Again"
        user_input = gets.chomp
      elsif user_input.to_i < comp_selection
        puts "Too Low -> Choose Again"
        user_input = gets.chomp
      elsif user_input.to_i == comp_selection
        correct
      end
    end
  end
end

 game1 = GuessingGame.new
 game1.run_game
