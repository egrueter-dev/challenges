def leap_year(year)
  if year % 4 == 0
    puts "#{year} is not a leap year"

  elsif year % 100 != 0
    puts "#{year} is a leap year"

  elsif year % 400 != 0
    puts "#{year} is not a leap year"

  else
    puts "#{year} is a leap year"
  end
end

puts leap_year(1923)
