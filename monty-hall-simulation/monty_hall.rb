# YOUR CODE HERE

# Write a program to simulate the game show and report how
# often each the user guesses correctly. The program should
# simulate two different scenarios: one where the user switches
# doors and another when the user doesn't. The simulation
# should be run **n** times where **n** is passed as a
# command-line argument (i.e. `ruby monty_hall.rb 100`
# should run the simulation 100 times). Print out the outcomes for
# both scenarios as a percentage of games guessed correctly.


car = wins = 0
many = 100000

many.times do
    choice1 = rand(3)
    host_opts = [0, 1, 2] - [choice1, car]
    choice2 = [0, 1, 2] - [choice1, host_opts.first]
    wins += 1 if choice2 == [car]
end

puts "#{(wins * 100) / many}%"




















# # def test_input(n) #learn command line arguments...
# #   if n == 1
# #     puts "test"
# #   else
# #     puts "no"
# #   end
# # end
#
# puts "Please select a door: |door1|-----|door2|-----|door3|"
# selection1 = gets.chomp.to_s
# options = {"door1" => "Goat", "door2" => "Car", "door3" => "Goat"}
# puts "Thanks for the selection, i'll show you what's behind a different door."
#
# if selection1 == "door3"
#   puts "--------|#{options["door1"]}|-----|door2|-----|door3|"
# elsif selection1 == "door1" || selection1 == "door2"
#   puts "--------|door1|-----|door2|-----|#{options["door3"]}|"
# end
#
# puts "Given this information, do you want to select again? (y/n)"
# choice = gets.chomp.to_s
#
# if choice == "n"
#   puts "You got a #{options[selection1]}"
#
# elsif choice == "y"
#   puts "Please select another door"
#   selection2 = gets.chomp.to_s
# if selection2 == selection1
#   puts "You picked the same one..pick again."
#   false
#   selection2 = gets.chomp.to_s
#
#
#
#
#
#
# #
# # end
# #    if selection2 == "door1"
# #          puts "You got a #{options["door1"]}"
# #        elsif selection2 == "door2"
# #          puts "You got a #{options["door2"]}"
# #        elsif selection2 == "door3"
# #          puts "You got a #{options["door2"]}"
# #        end
# #    end
# # end
