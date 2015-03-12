require 'pry'
class Recipe
  def initialize(recipe_id, recipe_name,recipe_description,recipe_instructions,ingredient_class)

    @id = recipe_id
    @name = recipe_name
    @description = recipe_description
    @instructions = recipe_instructions
    @ingredients = ingredient_class
  end

  def ingredients
    @ingredients
  end

  def instructions
    @instructions
  end

  def description
    @description
  end

  def id
    @id
  end

  def name
    @name
  end

  def self.db_connection
      connection = PG.connect(dbname: "recipes")
  end

  def self.all
    self.db_connection
    recipes = connection.exec_params("SELECT * from recipes")
    recipe_all = recipes.to_a
    recipe_list = []
      recipe_all.each do |recipe|
        recipe_list << Recipe.new(recipe["id"], recipe["name"], recipe["description"], recipe["instructions"], @ingredients)
      end
    recipe_list
  end


  def self.find(params_id)
    self.db_connection
    recipe_id_check = connection.exec_params("SELECT recipes.name FROM recipes WHERE recipes.id='#{params_id}';").to_a
    if recipe_id_check == []
      @recipe = Recipe.new("Not Present", "This recipe doesn't have a description.", "This recipe doesn't have a description.", "This recipe doesn't have any instructions.", [])
    else
      recipe = connection.exec_params("
      SELECT ingredients, recipes.name, recipes.instructions, recipes.description, recipes.id
      FROM recipes
      JOIN ingredients
      ON recipes.id = ingredients.recipe_id
      WHERE recipes.id='#{params_id}';").to_a.first

      ingredients = connection.exec_params("SELECT ingredients
      FROM ingredients
      JOIN recipes
      ON recipes.id = ingredients.recipe_id
      WHERE recipes.id='#{params_id}';")

      ingredient_array = ingredients.to_a
      ingredient_class = []
      ingredient_array.each do |ingredient|
        ingredient_class << Ingredient.new(ingredient["ingredients"])
      end

      @recipe = Recipe.new(recipe["id"],recipe["name"], recipe["description"],recipe["instructions"], ingredient_class)
    end
  end
end
