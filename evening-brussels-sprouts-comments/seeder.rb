require 'pg'
require 'pry'


TITLES = ["Roasted Brussels Sprouts",
  "Fresh Brussels Sprouts Soup",
  "Brussels Sprouts with Toasted Breadcrumbs, Parmesan, and Lemon",
  "Cheesy Maple Roasted Brussels Sprouts and Broccoli with Dried Cherries",
  "Hot Cheesy Roasted Brussels Sprout Dip",
  "Pomegranate Roasted Brussels Sprouts with Red Grapes and Farro",
  "Roasted Brussels Sprout and Red Potato Salad",
  "Smoky Buttered Brussels Sprouts",
  "Sweet and Spicy Roasted Brussels Sprouts",
  "Smoky Buttered Brussels Sprouts",
  "Brussels Sprouts and Egg Salad with Hazelnuts"]


COMMENTS = [
    "Roawdawouts",
    "Fresh Brussels Sprouts Soup",
    "Brussels Spadwdhlanumbs, Parmesan, and Lemon",
    "Cheesyklafolawldnkawdihawdawds and Broccoli with Dried Cherries",
    "Hoawdawdawdawdawdawdawout Dip",
    "Pomegranate Rawdawdawdawdawdawdro",
    "Roasted Brussels Sprout and Red Potato Salad",
    "Smoky Buttered Brussels Sprouts",
    "Sasldkjawldjawldjawdliawdladwj",
    "Smolakdi23 1412321m adn<!!!!s",
    "Basdjadlawdiawdlkawdnls", "Roawdawouts",
    "Fresh Brussels Sprouts Soup",
    "Brussels Spadwdhlanumbs, Parmesan, and Lemon",
    "Cheesyklafolawldnkawdihawdawds and Broccoli with Dried Cherries",
    "Hoawdawdawdawdawdawdawout Dip",
    "Pomegranate Rawdawdawdawdawdawdro",
    "Roasted Brussels Sprout and Red Potato Salad",
    "Smoky Buttered Brussels Sprouts",
    "Sasldkjawldjawldjawdliawdladwj",
    "Smolakdi23 1412321m adn<!!!!s",
    "Basdjadlawdiawdlkawdnls"
]

#WRITE CODE TO SEED YOUR DATABASE AND TABLES HERE
#$ psql news_aggregator_development < schema.sql

####################
# Seeding the Data #
####################

def server_connect
  begin
    connection = PG.connect(dbname:"brussels_sprouts_recipes")
    yield(connection)
  ensure
    connection.close
  end
end

# These are only used once to populate the DB

# def insert_titles(titles)
#   id = 1
#   TITLES.each do |title|
#     server_connect do |conn|
#       conn.exec_params("INSERT INTO recipes (recipeid,recipe) VALUES ($1,$2);", [id,title])
#     end
#     id += 1
#   end
# end
#
# insert_titles(TITLES)

# def insert_comments(comments)
#   commentid = 1
#   COMMENTS.each do |comments|
#     recipeid = rand(1..11)
#     puts comments
#     server_connect do |conn|
#       conn.exec_params("INSERT INTO comments (recipeid,commentid,comments) VALUES ($1,$2,$3);", [recipeid,commentid,comments])
#     end
#     commentid += 1
#   end
# end

# insert_comments(TITLES)

#########################
#
# Answering the Questions
#
#########################

### How many recipies are there in total? ###

  # recipe_count = server_connect do |conn|
  #     conn.exec_params("select * from recipes;")
  # end
  #
  # puts recipe_count.count

### How many comments are there in total? ###
  #
  # comment_count = server_connect do |conn|
  #     conn.exec_params("select * from comments;")
  # end
  #
  # puts comment_count.count

### How would you find how many comments each of the recipies have? ###
#
# comment_count = server_connect do |conn|
#      conn.exec_params("SELECT COUNT(*) FROM comments where recipeid='1';")
# end
#
# binding.pry

### What is the name of the recipe that is associated with a specific comment?
