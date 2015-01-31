# The output of the program should look as follows:

# What is the amount being invested: 1000
# What is the annual interest rate (percentage): 10
# How many years will it accrue interest: 25

# The final value will be $10834.71 after 25 years.

# ====================
# YOUR CODE GOES HERE
# ====================

def comp_calc(years_comp, interest, initial_value)
    years = years_comp
  loop do
    years -= 1
    one_year = initial_value * interest
    initial_value = initial_value + one_year
    break if years == -1
    $final_value = initial_value
  end
printf("The final value will be $%.2f after %d years", $final_value, years_comp)
end

comp_calc(25, 0.10, 1000)
