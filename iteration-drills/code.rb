

# array = [28214, 63061, 49928, 98565, 31769, 42316, 23674, 3540, 34953, 70282, 22077, 94710, 50353, 17107, 73683, 33287, 44575, 83602, 33350, 46583]

# Write Ruby code to find out the answers to the following questions:
### * What is the sum of all the numbers in `array`?
# sum = 0
# array.each do |number|
#   sum += number
# end
#
# puts sum


### * How would you print out each value of the array?
#
# array.each do |number|
#   print number.to_s + " "
# end

### * What is the sum of all of the even numbers?

# sum = 0
# array.each do |number|
#   if number % 2 == 0
#     puts number
#     sum += number
#   end
# end
# puts sum

### * What is the sum of all of the odd numbers?
#
# sum = 0
# array.each do |number|
#   if number % 2 != 0
#     sum += number
#   end
# end
# puts sum

# # * What is the sum of all the numbers divisble by 5?

# sum = 0
# array.each do |number|
#   if number % 5 == 0
#     sum += number
#   end
# end
#
# puts sum


# # * What is the sum of the squares of all the numbers in the array?

# sqd = 0
# sum = 0
#
# array.each do |number|
#   number
#   sqd = number * number
#   sum += sqd
# end
#
# puts sum


 #array = ["annamarie", "muriel", "drew", "reva", "belle", "amari", "aida", "kaylie", "monserrate", "jovan", "elian", "stuart", "maximo", "dennis", "zakary", "louvenia", "lew", "crawford", "caitlyn"]


## Write Ruby code to find out the answers to the following questions:


# # * How would you print out each name backwards in `array`?

# array.each do |name|
#   puts name.reverse
# end



# # * What are the total number of characters in the names in `array`?

# total_chars = 0
#
# array.each do |name|
#   total_chars += name.length
# end
#
# puts total_chars

# # * How many names in `array` are less than 5 characters long?
#
# sum = 0
# array.each do |names|
#   if names.length < 5
#     sum +=1
#   end
# end
#
# puts sum

# # * How many names in `array` end in a vowel?

# num = 0
#
# array.each do |name|
#   if name[-1] =~ /[aeiou]/
#     num += 1
#   end
# end
#
# puts num


# # * How many names in `array` are more than 5 characters long?

# names_plusfive = 0
#
# array.each do |name|
#   if name.length > 4
#     names_plusfive += 1
#   end
# end
#
# puts names_plusfive


## * How many names in `array` are exactly 5 characters in length?


# has_five_letters = 0
#
# array.each do |name|
#   if name.length == 4
#     has_five_letters += 1
#   end
# end
#
# puts has_five_letters


# best_records = {
#  "Tupac"=>"All Eyez on Me",
#  "Eminem"=>"The Marshall Mathers LP",
#  "Wu-Tang Clan"=>"Enter the Wu-Tang (36 Chambers)",
#  "Led Zeppelin"=>"Physical Graffiti",
#  "Metallica"=>"The Black Album",
#  "Pink Floyd"=>"The Dark Side of the Moon",
#  "Pearl Jam"=>"Ten",
#  "Nirvana"=>"Nevermind"
#  }

# #  Write Ruby code to find out the answers to the following questions:

# # * How would you print out all the names of the artists?

# best_records.each do |artist|
#   puts artist
# end
#


# # * How would you print out all the names of the albums?
#
# best_records.each do |artist, record|
#   puts record
# end

# # * Which artist has the longest name?
#
# sum = 0
# largest = ''
#
# best_records.each do |artist, song|
#   if artist.length > sum
#     sum = artist.length
#     largest = artist
#   elsif largest.length > artist.length
#     puts "largest is #{largest}"
#     exit
#   else
#     puts "Both #{largest} and #{artist} are the longest."
#     exit
#   end
# end


# # * How would you change all the album titles for every artist to `Greatest Hits`?

# best_records.each {|x,y| y.replace "Greatest Hits"}
# puts best_records


# * How would you delete a key-value pair if the artist's name ends in a vowel?

# best_records.each do |artist, song|
#   if artist[-1] =~ /[aeiou]/
#       deleted << artist
#       best_records.delete artist
#   end
# end
#   puts best_records

 # ages = {"Arch"=>89, "Gretchen"=>93, "Simone"=>12, "Daija"=>96, "Alivia"=>22,
 #   "Serena"=>28, "Alek"=>3, "Lula"=>24, "Christian"=>62, "Darryl"=>47,
 #  "Otha"=>32, "Evalyn"=>44, "Lincoln"=>27, "Rebeca"=>99, "Beatrice"=>99,
 #  "Kelton"=>10, "Zachary"=>18, "Aurelie"=>91, "Dell"=>71, "Lisandro"=>22}


# # Write Ruby code to find out the answers to the following questions:
#
# # * How would you print out all the names of `ages`?

# ages.each do |name,age|
#   puts name
# end

## * How would you print out each key-value pair in the format of `<name> is <age> years old.`?
#
# ages.each do |name, age|
#   puts "#{name} is #{age} years old"
# end



# # * How would you print out every person with odd numbered age?
#
# ages.each do |name, age|
#   if age % 2 != 0
#     puts name
#   end
# end


# # * How would you delete everyone under 25 years of age?
#
# ages.each do |name, age|
#   if age < 25
#     ages.delete name
#   end
# end
#
# puts ages

# # * What is the name and age of everyone with a name greater than or equal to 5 characters?
#
# ages.each do |name, age|
#   if name.length > 5
#     puts name, age
#   end
# end


people =
{
  "Alia O'Conner PhD" => {
         "phone" => "538.741.1841",
       "company" => "Leuschke-Stiedemann",
      "children" => [
          "Simone",
          "Cindy",
          "Jess"
      ]
  },
           "Ike Haag" => {
         "phone" => "(661) 663-8352",
       "company" => "Carter Inc",
      "children" => [
          "Joe",
          "Ofelia",
          "Deron"
      ]
  },
       "Brian Heller" => {
         "phone" => "1-288-601-5886",
       "company" => "O'Conner Group",
      "children" => [
          "Renee"
      ]
  },
       "Maryse Johns" => {
         "phone" => "218-571-8774",
       "company" => "Kuhlman Group",
      "children" => [
          "Dominick",
          "Tricia"
      ]
  },
  "Dr. Adela DuBuque" => {
        "phone" => "1-203-483-1226",
      "company" => "Heidenreich, Nietzsche and Dickinson"
  }
}

# # Write Ruby code to find out the answers to the following questions:
#
# # * How would you print out all the names of `people`?
#
# people.each do |person,data|
#   puts person
# end

# # * How would you print out all the names of `people` and which company they work for?

# people.each do |person, data|
#   puts "Person #{person} | Company: #{data["company"]}"
# end

# # * What are the names of all the children of everyone in `people`?
#
# people.each do |person, data|
#   puts data["children"]
# end


# # What are the names of all the companies that people work for?

# people.each do |person, data|
#     puts data["company"]
# end


# # How would you convert all the phone numbers to the same standard (pick one)?

# people.each do |person, data|
#   new_phone = data["phone"].gsub(/\D/, '')
#   # puts new_phone
#     if new_phone.length > 10
#       new_phone.slice!(0)
#    end
#    puts "1-" + new_phone.scan(/\d\d\d/).join('-')
# end


# 
# people =
# [
#     {
#           "Derek Wehner" => {
#                "phone" => "588-047-7782",
#              "company" => "Daniel-Carroll",
#             "children" => [
#                 "Phoebe",
#                 "Gretchen",
#                 "Wiley"
#             ]
#         },
#            "Ali Koelpin" => {
#                "phone" => "1-127-057-0020",
#              "company" => "Rau, Rutherford and Lockman",
#             "children" => [
#                 "Juwan"
#             ]
#         },
#         "Ervin Prohaska" => {
#                "phone" => "(393) 630-3354",
#              "company" => "Carter Inc",
#             "children" => [
#                 "Virgil",
#                 "Piper",
#                 "Josianne"
#             ]
#         },
#           "Hellen Borer" => {
#               "phone" => "1-687-825-0947",
#             "company" => "Maggio, Ferry and Moen"
#         }
#     },
#     {
#         "Elinor Johnson" => {
#               "phone" => "819.911.5553",
#             "company" => "Pollich Group"
#         }
#     },
#     {
#         "Richmond Murray" => {
#                "phone" => "1-516-432-2364",
#              "company" => "Sporer and Sons",
#             "children" => [
#                 "Kade",
#                 "Sage"
#             ]
#         },
#             "Nakia Ferry" => {
#                "phone" => "134-079-2237",
#              "company" => "Hamill, O'Keefe and Lehner",
#             "children" => [
#                 "Rollin"
#             ]
#         }
#     }
# ]

# # Write Ruby code to find out the answers to the following questions:

# # * What are the names of everyone in `people`?

# people.each do |chunks_of_data|
#   chunks_of_data.each do |name, info|
#     puts name
#   end
# end

# # * What are the names of all the children in `people`?

# people.each do |chunks_of_data|
#   chunks_of_data.each do |name, info|
#     puts info["children"]
#   end
# end

# # * How would you create a new hash called `phone_numbers` that has a key of a name and value of a phone number in `people`?

# people.each do |chunks_of_data|
#   chunks_of_data.each do |name, info|
#     puts phone_numbers = { name => info["phone"] }
#   end
# end

# # * How would you create a new hash called `employers` that has a key of a name and a value of a company name in `people`?

# people.each do |chunks_of_data|
#   chunks_of_data.each do |name, info|
#     puts employers = {name => info["company"]}
#   end
# end
#

# # * How would you create a new hash called `children_count` that has a key of a name and a value of the number of children a person has?

# people.each do |chunks_of_data|
#   chunks_of_data.each do |name, info|
#     if info["children"] == nil
#       info["children"] = []
#     end
#       puts children_count = {name => info["children"].count}
#   end
# end
