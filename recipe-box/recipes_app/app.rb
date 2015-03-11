require 'sinatra'
require 'sinatra/reloader'
require 'pg'

configure :development, :test do
  require 'pry'
end

Dir[File.join(File.dirname(__FILE__), 'lib', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

#########################

# DB Connection methods #

#########################

def server_connect
  begin
    connection = PG.connect(dbname: "recipes")
    yield(connection)
  ensure
    connection.close
  end
end

get '/recipes' do
  @title = "All Recipes in Alphabetical order."

    recipes= nil
    server_connect do |conn|
      recipes = conn.exec_params("
      SELECT recipes.name, recipes.id
      FROM recipes
      ORDER BY recipes.name;")
    end
  erb :index, locals: {recipes: recipes.to_a }
end

get "/recipes/:id" do

  #Recipes must include

  raw_data = nil
  server_connect do |conn|
    raw_data = conn.exec_params("
    SELECT recipes.name as recipe_name, instructions, description, ingredients
    FROM recipes
    RIGHT OUTER JOIN ingredients
    ON recipes.id = ingredients.recipe_id
    WHERE recipes.id=#{params["id"]};")
  end

  recipe_data = raw_data.to_a[0]
  binding.pry

  erb :id, locals: { recipe: recipe_data}
end

#RH's answer

# SELECT recipes.name AS recipe_name, description, instructions, ingredients.name AS ingredient_name
# FROM recipes
# LEFT OUTER JOIN ingredients
# ON ingredients.recipe_id = recipes.id
# WHERE recipes.id = 380;


# SELECT recipes.name AS recipe_name, description, instructions, ingredients.name AS ingredient_name
# FROM recipes
# LEFT OUTER JOIN ingredients
# ON ingredients.recipe_id = recipes.id
# WHERE recipes.id = 430;

# SELECT recipes.name as recipe_name, instructions, description, ingredients
# FROM recipes
# RIGHT OUTER JOIN ingredients
# ON recipes.id = ingredients.recipe_id
# WHERE recipes.id=896;
# #
# # ]
#
#
# SELECT ingredients.name AS ingredient, recipes.name as recipe, recipes.id, ingredients.id, recipes.description
# FROM ingredients
# JOIN recipes
# ON recipes.id = ingredients.recipe_id
# WHERE recipes.id=896;
