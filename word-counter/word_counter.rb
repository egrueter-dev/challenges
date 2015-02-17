# YOUR CODE HERE

##"Print out the most x most commonly used words in a file. ##

def program(top_numbers)

  stop_words = []
  File.open("stop_words.txt") do |f|
    f.each do |line|
      no_apost = line.gsub(/['"]/, '').chomp
      stop_words << no_apost
    end
  end

  string = ""
  File.open ("poe_usher.txt") do |f|
      f.each do |line|
        string << line
      end
  end

  #Cleaning up poe_usher.txt
  caps_removed = string.gsub(/[A-Z]/) { |upper| upper.downcase }
  punctuation_removed = caps_removed.gsub(/[.,"-?]/,"")
  collection_of_words = punctuation_removed.split(" ")
  frequencies_hash = Hash.new(0)
  collection_of_words.each {|word| frequencies_hash[word] +=1 }
  final_set = frequencies_hash.sort_by { |word, count| count }.reverse!

  #Getting stop_words into an array
  arr = []
  stop_words.each do |word|
    arr << word
  end

  #Creating a new array just for word values, no count
  final_array = []
  final_set.each do |word,count|
    final_array << word
  end

  #Removing commonly worded elements
  (arr & final_array).each {|i| final_array.delete(i)}

  #Creating a final hash with only nontrivial words & their counts
  final_hash = []
  final_array.each do |word|
    final_hash << { word => frequencies_hash[word] }
  end

  #Sorting new hash
  final_hash.sort_by { |word, count| count }

  #Removing the X number of numbers from the list
  final_array = []
  final_hash[0..top_numbers].each do |word|
    final_array << word.to_a
  end

  final_array.each do |subarray|
      subarray.each do |word,value|
        puts "#{word}: #{value}"
      end
  end

end

# program(10)
