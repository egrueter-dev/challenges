#YOUR CODE GOES HERE
# 1. First produce the formatted output with plain Ruby.
# 2. Next produce the formatted output with `erb`. A short blog titled
#[Ruby's ERB Templating System](http://www.rrn.dk/rubys-erb-templating-system) could be helpful here.

###Learning Goals
# Utilizing a hash to print human readable format on the screen.
# Make use of Ruby's `erb` library to print out data in specific format.

###Input
require 'erb'

#ruby

def data
recipe = {
  name: "Roasted Brussel Sprouts",
  ingredients: [
    "1 1/2 pounds Brussels sprouts",
    "3 tablespoons good olive oil",
    "3/4 teaspoon kosher salt",
    "1/2 teaspoon freshly ground black pepper"
    ],
  directions: [
    "Preheat oven to 400 degrees F.",
    "Cut off the brown ends of the Brussels sprouts.",
    "Pull off any yellow outer leaves.",
    "Mix them in a bowl with the olive oil, salt and pepper.",
    "Pour them on a sheet pan and roast for 35 to 40 minutes.",
    "They should be until crisp on the outside and tender on the inside.",
    "Shake the pan from time to time to brown the sprouts evenly.",
    "Sprinkle with more kosher salt ( I like these salty like French fries).",
    "Serve and enjoy!"
    ]
  }
end

def name
  data[:name]
end



template_string =

'''
#================================#
#Recipie: <%= name %>"#
#================================#

Ingredients
-----------

<% data[:ingredients].each do |i| %>
 <%= i %>
<% end %>


Directions
----------
<% c = 0 %>
<% data[:directions].each do |i| %>
<% c += 1 %>
  <%=c.to_s + ". " + i%>
<% end %>

'''

template = ERB.new(template_string, nil, "<>")
puts template.result


# ###Output
# # ```
# # #=================================#
# # # Recipe: Roasted Brussel Sprouts #
# # #=================================#
# #
# # Ingredients
# # -----------
# #
# # 1 1/2 pounds Brussels sprouts
# # 3 tablespoons good olive oil
# # 3/4 teaspoon kosher salt
# # 1/2 teaspoon freshly ground black pepper
# #
# # Directions
# # ----------
# #
# # 1. Preheat oven to 400 degrees F.
# #
# # 2. Cut off the brown ends of the Brussels sprouts.
# #
# # 3. Pull off any yellow outer leaves.
# #
# # 4. Mix them in a bowl with the olive oil, salt and pepper.
# #
# # 5. Pour them on a sheet pan and roast for 35 to 40 minutes.
# #
# # 6. They should be until crisp on the outside and tender on the inside.
# #
# # 7. Shake the pan from time to time to brown the sprouts evenly.
# #
# # 8. Sprinkle with more kosher salt ( I like these salty like French fries).
# #
# # 9. Serve and enjoy!
# # ```
