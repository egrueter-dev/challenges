transactions = [50_000, -2_000, -25_000, 4_000, -12_000, 5_000, -800, -900, 43_000, -30_000, 15_000, 62_000, -50_000, 42_000]

# Write Ruby code to find out the answers to the following questions:

# * What is the value of the first transaction?

# puts transactions[0]

# * What is the value of the second transaction?

# puts transactions[1]

# * What is the value of the fourth transaction?

# puts transactions[5]

# * What is the value of the last transaction?

# puts transactions[-1]

# * What is the value of the second from last transaction?

# puts transactions[-2]

# * What is the value of the 5th from last transaction?

# puts transactions[-5]

# * What is the value of the transaction with index 5?

# puts transactions[5]

# * How many transactions are there in total?

# puts transactions.count

# * How many positive transactions are there in total?

# puts transactions.count { |x| x > 0 }

# * How many negative transactions are there in total?

# puts transactions.count { |x| x < 0 }

# * What is the largest withdrawal?

 # puts transactions.min

# * What is the largest deposit?

# puts transactions.max

# * What is the small withdrawal?

# withdrawals = []
# transactions.each {|x| withdrawals << x if x < 0}
# puts withdrawals.max

# * What is the smallest deposit?

# deposits = []
# transactions.each {|x| deposits << x if x > 0}
# puts deposits.min

# * What is the total value of all the transactions?

# puts transactions.reduce(:+)

# * If Dr. Dre's initial balance was $239,900 in this account, what is the value of his balance after his last transaction?

# puts balace_value = 239900 + transactions.reduce(:+) #total transaction value added to initial balance.


best_records = {
 "Tupac"=>"All Eyez on Me",
 "Eminem"=>"The Marshall Mathers LP",
 "Wu-Tang Clan"=>"Enter the Wu-Tang (36 Chambers)",
 "Led Zeppelin"=>"Physical Graffiti",
 "Metallica"=>"The Black Album",
 "Pink Floyd"=>"The Dark Side of the Moon",
 "Pearl Jam"=>"Ten",
 "Nirvana"=>"Nevermind"
 }

# Write Ruby code to find out the answers to the following questions:

# * How many records are in `best_records`?

#puts best_records.count

# * Who are all the artists listed?

# best_records.each do |artist,title|
#   puts artist
# end

# * What are all the album names in the hash?

# best_records.each do |artist, title|
#   puts title
# end

# * Delete the `Eminem` key-value pair from the list.

# best_records.delete("Eminem")
# puts best_records

# * Add your favorite musician and their best album to the list.
#
# best_records["Glitch Mob"] = "Love, Death, Immortality"
# puts best_records

# * Change `Nirvana`'s album to another.

# best_records["Nirvana"] = "New Album!"
# puts best_records

# * Is `Nirvana` included in `best_records`?

# puts best_records.find_all { |artist| artist = "Nirvana"}

# * Is `Soundgarden` included in `best_records`?

 puts best_records.find {|artist| return "sds" if artist == "Nirvana"}

# * If `Soundgarden` is not in `best_records` then add a key-value pair for the band.
# * Which key-value pairs have a key that has a length less than or equal to 6 characters?
# * Which key-value pairs have a value that is greater than 10 characters?
