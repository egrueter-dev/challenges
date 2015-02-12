def translate(sentence)
#
#   # * If the word begins with a consonant or consonant
#   # cluster, move the consonant(s) to the end of the word and append *ay*
#   # (e.g. **happy** becomes **appyhay**, **child** becomes **ildchay**).
#
#   # * If the word begins with a vowel
#   # append *way* to the end of the word
#   # (e.g. **egg** becomes **eggway**)
#

sentence = sentence.split(" ")
  sentence.each do |word|
    if word.start_with?("a","e","i","o","u") == true
      word << "way"
    elsif word.start_with?("a","e","i","o","u") == false
       con_chunk = word.scan(/[^aeiou]+/)[0]
       word.slice!(con_chunk)
       append = con_chunk + "ay"
       word << append
    end
  end

  return sentence.join(" ").chomp

end

 input = ARGV.join(" ")
 translate("child daisy joe")
