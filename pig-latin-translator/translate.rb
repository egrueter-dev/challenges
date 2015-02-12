def translate(sentence)

  # * If the word begins with a consonant or consonant
  # cluster, move the consonant(s) to the end of the word and append *ay*
  # (e.g. **happy** becomes **appyhay**, **child** becomes **ildchay**).

  # * If the word begins with a vowel
  # append *way* to the end of the word
  # (e.g. **egg** becomes **eggway**)

 #
 # vowels = ("a","e","i","o","u")
 # consonant = "all else"
 #

sentence = sentence.split(" ")

sentence.each do |word|
  if word.start_with?("a","e","i","o","u") == true
    word << "way"
  elsif word.start_with?("a","e","i","o","u") == false
    first_l = word.slice!(0)
    append = first_l + "ay"
    word << append
  end
end

print sentence.join(" ")




end

input = ARGV.join(" ")
puts translate("pig latin translator")
