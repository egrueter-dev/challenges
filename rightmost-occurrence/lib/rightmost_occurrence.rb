# # # YOUR CODE HERE

def right_most( word, c )
  count = 1
  split = word.split('')
  split.reverse!
  split.each do |letter|
    count -= 1
    if letter == c
      puts count
      break
    end
  end
end

puts right_most('erikthekool','k')
