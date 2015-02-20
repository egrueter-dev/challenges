# YOUR CODE HERE

# "Print out the most x most commonly used words in a file. #
  textfile = ARGV[0]
  top_numbers = ARGV[1].to_i

  stop_words = File.read("stop_words.txt").split
  string = File.read(textfile).gsub(/[^a-z']/i,' ').downcase.split

  #Cleaning up poe_usher.txt
  frequencies_hash = Hash.new(0)
  string.each {|word| frequencies_hash[word] +=1 }
  final_set = frequencies_hash.sort_by { |word, count| count }.reverse!
  puts final_set

  #Creating a new array just for words, no count
  final_array = []
  final_set.each do |word,count|
    final_array << word
  end

  #Removing commonly worded elements
  (stop_words & final_array).each {|i| final_array.delete(i)}

  #Creating a final hash with only nontrivial words & their counts
  final_hash = []
  final_array.each do |word|
    final_hash << { word => frequencies_hash[word] }
  end

  #Sorting new hash
  final_hash.sort_by { |word, count| count }

  #Removing the x number of numbers from the list
  final_array = []
  final_hash[0..top_numbers].each do |word|
    final_array << word.to_a
  end

  final_array.each do |subarray|
      subarray.each do |word,value|
        puts "#{word}: #{value}"
      end
  end
